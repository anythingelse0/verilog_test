
SIM_FILELIST := $(SIM_FILELIST) -f sim_verilator.fl

compile:
	verilator --binary -j 0 -Wall $(SIM_FILELIST) --trace

clean:
	rm -rf obj_dir
