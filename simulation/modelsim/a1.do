onerror {resume}
quietly WaveActivateNextPane {} 0
delete wave *
add wave -noupdate /TB_SYSTEM/eachvec

add wave  -divider Parallel2Serial
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_CLOCK_50
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_RESET_InHigh
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_soc_InLow
add wave  -radix Binary /TB_SYSTEM/TB_SYSTEM_dataparallel_BUS_In
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_dataserial_Out
add wave -noupdate /TB_SYSTEM/TB_SYSTEM_eoc_OutLow

add wave  -divider REGP2S
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_REGP2S_u0/SC_REGP2S_load_InLow
add wave  -radix Binary /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_REGP2S_u0/SC_REGP2S_dataparallel_BUS_In
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_REGP2S_u0/SC_REGP2S_dataserial_Out
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_REGP2S_u0/REGP2S_Register

add wave  -divider COUNTER
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_COUNTER_u0/SC_COUNTER_count_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_COUNTER_u0/SC_COUNTER_eoc_OutLow
add wave  -radix Unsigned /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_COUNTER_u0/COUNTER_Register

add wave  -divider STATEMACHINE
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_soc_CONTROL_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_COUNTER_eoc_CONTROL_InLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_COUNTER_count_CONTROL_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_eoc_CONTROL_OutLow
add wave -noupdate /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_STATEMACHINE_u0/SC_STATEMACHINE_REGP2S_load_CONTROL_OutLow
add wave -noupdate -radix decimal /TB_SYSTEM/BB_SYSTEM_u0/WB_SYSTEM_u0/SC_STATEMACHINE_u0/STATE_Register



restart
run 1ms

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {319999492 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 445
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {59829352 ps} {60892417 ps}
