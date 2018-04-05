transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Justin/Documents/1\ Fall\ 2016/ECE\ 2300/Labs/Lab\ 5/lab5_dista {C:/Users/Justin/Documents/1 Fall 2016/ECE 2300/Labs/Lab 5/lab5_dista/decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/Justin/Documents/1\ Fall\ 2016/ECE\ 2300/Labs/Lab\ 5/lab5_dista {C:/Users/Justin/Documents/1 Fall 2016/ECE 2300/Labs/Lab 5/lab5_dista/decoder_top.v}

vlog -vlog01compat -work work +incdir+C:/Users/Justin/Documents/1\ Fall\ 2016/ECE\ 2300/Labs/Lab\ 5/lab5_dista {C:/Users/Justin/Documents/1 Fall 2016/ECE 2300/Labs/Lab 5/lab5_dista/decoder_test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  decoder_test

add wave *
view structure
view signals
run -all
