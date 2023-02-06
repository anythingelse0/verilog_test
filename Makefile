
SIM_FILELIST := $(SIM_FILELIST) -f sim_verilator.fl

compile:
	verilator --binary -j 0 -Wall $(SIM_FILELIST)

clean:
	rm -rf obj_dir
