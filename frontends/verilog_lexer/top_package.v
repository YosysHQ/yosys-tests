`resetall

package my_pkg;
 // typedef enum bit [1:0] { RED, YELLOW, GREEN, RSVD } e_signal;
/*  typedef struct { bit [3:0] signal_id;
                     bit       active;
                     bit [1:0] timeout;
                   } e_sig_param;

  function common ();
      $display ("Called from somewhere");
     endfunction

    task run ();
    endtask */
endpackage

{* AAA *}
//

\
module mux2 (S,A,B,Y);
    input S;
    input A,B;
    output reg Y;
    reg a_vect[ 0 +: 8];
    reg b_vect[ 0 -: 8];
	//import my_pkg::*;

     always @(*)
		Y = (S)? B : A;
endmodule
