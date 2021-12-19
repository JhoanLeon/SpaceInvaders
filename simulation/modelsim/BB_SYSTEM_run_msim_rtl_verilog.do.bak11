transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Proyectos\ Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl {C:/Proyectos Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl/SC_COUNTER.v}
vlog -vlog01compat -work work +incdir+C:/Proyectos\ Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl {C:/Proyectos Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl/SC_STATEMACHINE.v}
vlog -vlog01compat -work work +incdir+C:/Proyectos\ Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl {C:/Proyectos Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl/SC_REGP2S.v}
vlog -vlog01compat -work work +incdir+C:/Proyectos\ Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students {C:/Proyectos Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/BB_SYSTEM.v}
vlog -vlog01compat -work work +incdir+C:/Proyectos\ Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl {C:/Proyectos Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/rtl/WB_SYSTEM.v}

vlog -vlog01compat -work work +incdir+C:/Proyectos\ Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/simulation/modelsim {C:/Proyectos Quartus/Proyecto_BibliotecaSecuencial/PRJ0_Parallel2Serial_1_2_Students/simulation/modelsim/TB_SYSTEM.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TB_SYSTEM

add wave *
view structure
view signals
run -all
