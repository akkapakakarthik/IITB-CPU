transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/CPU.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/ALU.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/FSM.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/datapath.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/signed extender.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/register_n.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/testbench.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/memory.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/left_shifter.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/n_sel_mux.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/left_shifter_2mul.vhd}
vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/register file.vhd}

vcom -93 -work work {C:/Users/super/OneDrive/Desktop/Sem_3/EE224/CPU/testbench.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L fiftyfivenm -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
