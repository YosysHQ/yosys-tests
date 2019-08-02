#include <stdint.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <vector>
#include <unistd.h>

#include "Vtop.h"
#include "verilated.h"

/*
	A generic testbench for equivalence checking miters

	Expected to be used with a miter module providing the following interface:
		- clk: rising edge clock input, may be unused if not needed
		- din: an arbitrary width test vector input, set to random data at every cycle
		- miter: an arbitrary width miter output (each bit considering to a single test).
		         a bit going high means that test has failed.
*/

// Based on https://www.jstatsoft.org/article/view/v008i14
static uint64_t rng_state = 88172645463325252LL;
uint64_t xorshift64()
{
	uint64_t x = rng_state;
	x ^= x << 13;
	x ^= x >> 7;
	x ^= x << 17;
	return rng_state = x;
}

template <typename ModuleT>
struct ModuleWrapper {
	ModuleT tb;
	int tick_count = 0;
	// From https://zipcpu.com/blog/2017/06/21/looking-at-verilator.html
	void tick()
	{
		++tick_count;
		tb.clk = 0;
		tb.eval();
		tb.clk = 1;
		tb.eval();
		tb.clk = 0;
		tb.eval();
	}

	/*
		Template magic to cope with the fact that arbitrary width
		inputs might be scalar (<=64 bits) or vector(65+ bits)
	*/
	template <typename Tm> void set_input_impl(Tm &in)
	{
		in = xorshift64();
	}

	template <typename Tm, int N> void set_input_impl(Tm(&in)[N])
	{
		for (int i = 0; i < N; i++)
			in[i] = int32_t(xorshift64());
	}

	std::vector<int> failing;
	template <typename Tm> void check_miter_impl(Tm miter) {
		for (int i = 0; i < 64; i++)
			if (miter & (1UL << i))
				failing.push_back(i);
	}

	template <typename Tm, int N> void check_miter_impl(Tm(&miter)[N]) {
		for (int i = 0; i < N; i++)
			for (int j = 0; j < 32; j++)
				if (miter[i] & (1UL << j))
					failing.push_back(i * 32 + j);
	}

	template <typename Tm> void print_input_impl(Tm &in, std::ostream &out)
	{
		for (int i = 63; i >= 0; i--)
			out << ((in & (1UL << i)) ? '1' : '0');
	}

	template <typename Tm, int N> void print_input_impl(Tm(&in)[N], std::ostream &out)
	{
		for (int i = 0; i < N; i++) {
			for (int j = 31; j >= 0; j--)
				out << ((in[i] & (1UL << j)) ? '1' : '0');
			if (i != N-1)
				out << ' ';
		}
	}

	void set_input()
	{
		set_input_impl(tb.din);
	}

	void print_input(std::ostream &out)
	{
		print_input_impl(tb.din, out);
	}

	bool check_miter()
	{
		failing.clear();
		check_miter_impl(tb.miter);
		if (failing.empty()) {
			return true;
		} else {
			std::cerr << "Fail at tick " << tick_count << ":" << std::endl;
			std::cerr << "    current input: ";
			print_input(std::cerr);
			std::cerr << std::endl;
			std::cerr << "    failing tests:";
			for (auto fail : failing)
				std::cerr << " " << fail;
			std::cerr << std::endl;
			return false;
		}
	}
};

int main(int argc, char **argv)
{
	int opt;
	int N = 1000000;
	int Nwarmup = 10;

	while ((opt = getopt(argc, argv, "N:w:")) != -1) {
		switch (opt) {
			case 'N':
				N = std::atoi(optarg);
				break;
			case 'w':
				Nwarmup = std::atoi(optarg);
				break;
			default:
				std::cerr << "Miter testbench wrapper" << std::endl;
				std::cerr << "Usage: " << argv[0] << " [-N numcycles] [-w warmupcycles]" << std::endl;
				return 2;
		}
	}

	Verilated::commandArgs(argc, argv);
	ModuleWrapper<Vtop> mod;

	int rc = 0;
	for (int i = 0; i < (N + Nwarmup); i++) {
		mod.set_input();
		mod.tick();
		if (N > Nwarmup)
			if (!mod.check_miter())
				rc = 1;
	}
	return rc;
}