import os
is_heavy_enabled = int(os.getenv('ENABLE_HEAVY_TESTS', '0')) == 1
for root, dirs, files in sorted(os.walk(".")):
    for file in files:
        if file.endswith('.ys') or file.endswith('run-test.sh'):
            dir = os.path.basename(root)
            work = os.path.splitext(file)[0]
            heavy = os.path.exists(os.path.join(dir, "heavy_test"))
            is_disabled = os.path.exists(os.path.join(dir, work + ".disable"))
            print("all:: {0}/work_{1}/.stamp\n"
                  "{0}/work_{1}/.stamp:".format(dir, work))
            if (is_disabled):
                print("\t@echo 'Skipping disabled test {0}..'".format(dir, work))
                continue                
            if (heavy and not is_heavy_enabled):
                print("\t@echo 'Skipping heavy test {0}..'".format(dir, work))
                continue                
            print("\t@echo 'Running {2}{1}..'\n"
                  "\t@../run.sh {0} {1}\n"
                  "clean::\n"
                  "\t@echo 'Cleaning {1}..'\n"
                  "\t@rm -rf {0}/work_{1}".format(dir, work, "heavy " if heavy else ""))
print(".PHONY: all clean")