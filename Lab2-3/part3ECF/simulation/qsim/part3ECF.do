onerror {exit -code 1}
vlib work
vlog -work work part3ECF.vo
vlog -work work Part3Sim.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.part3ECF_vlg_vec_tst -voptargs="+acc"
vcd file -direction part3ECF.msim.vcd
vcd add -internal part3ECF_vlg_vec_tst/*
vcd add -internal part3ECF_vlg_vec_tst/i1/*
run -all
quit -f
