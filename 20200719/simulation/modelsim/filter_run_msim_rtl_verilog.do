transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib cordic2
vmap cordic2 cordic2
vlog -vlog01compat -work cordic2 +incdir+D:/Project/SDR_FPGA/20200719/cordic2/synthesis {D:/Project/SDR_FPGA/20200719/cordic2/synthesis/cordic2.v}
vlog -vlog01compat -work work +incdir+D:/Project/SDR_FPGA/20200719 {D:/Project/SDR_FPGA/20200719/unwrap.v}
vlog -vlog01compat -work work +incdir+D:/Project/SDR_FPGA/20200719 {D:/Project/SDR_FPGA/20200719/top.v}
vcom -93 -work cordic2 {D:/Project/SDR_FPGA/20200719/cordic2/synthesis/submodules/dspba_library_package.vhd}
vcom -93 -work work {D:/Project/SDR_FPGA/20200719/filter.vhd}
vcom -93 -work cordic2 {D:/Project/SDR_FPGA/20200719/cordic2/synthesis/submodules/dspba_library.vhd}
vcom -93 -work cordic2 {D:/Project/SDR_FPGA/20200719/cordic2/synthesis/submodules/cordic2_CORDIC_0.vhd}

vlog -vlog01compat -work work +incdir+D:/Project/SDR_FPGA/20200719 {D:/Project/SDR_FPGA/20200719/top_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -L cordic2 -voptargs="+acc"  top_tb

add wave *
view structure
view signals
run -all
