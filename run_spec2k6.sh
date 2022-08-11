#!/bin/bash

case_map="400.perlbench 401.bzip2 403.gcc 410.bwaves 416.gamess 429.mcf \
          433.milc 434.zeusmp 435.gromacs 436.cactusADM 437.leslie3d 444.namd \
          445.gobmk 447.dealII 450.soplex 453.povray 454.calculix 456.hmmer \
          458.sjeng 459.GemsFDTD 462.libquantum 464.h264ref 465.tonto 470.lbm \
          471.omnetpp 473.astar 481.wrf 482.sphinx3 483.xalancbmk 998.specrand \
          999.specrand"
complete_check_cases="410.bwaves 416.gamess 433.milc 434.zeusmp 435.gromacs 436.cactusADM \
         437.leslie3d 444.namd 447.dealII 450.soplex 453.povray 454.calculix \
         459.GemsFDTD 465.tonto 470.lbm 481.wrf 482.sphinx3 998.specrand"
complete_check_cases="473.astar $complete_check_cases"

# just for test
#complete_check_cases="462.libquantum $complete_check_cases"

case_help="possible case: $case_map"
[[ "$#" != "4" ]] && echo -e "$0 size iter exec case \n($case_help)" && exit 1

spec_run_size=$1
spec_run_iter=$2
spec_binary=`readlink -f $3`
spec_run_case=$4

[[ ! -e "$spec_binary" ]] && echo -e "\n$spec_binary doesn't exist" && exit 1

help_msg="$0 SIZE ITERATION BINARY_PATH SPEC_CASE"
help_msg="$help_msg\n\tSIZE=test, train, or ref"
help_msg="$help_msg\n\tSPEC_CASE=$case_map"

function sys_info {
    echo -e "[testHarness info] $1" > /dev/stderr
}

function extract_a_file_from_tarball {
    [[ "$#" != "3" ]] && echo -e "$0 tarball src_file dst_path" && exit 1
    local tarball=$1
    local src_file=$2
    local dst_path=$3

    [[ $(tar --version) == *busybox* ]] \
    && \
    tar xf ${tarball} ${src_file} -C ${dst_path} \
    || \
    tar xf ${tarball} -C ${dst_path} ${src_file}
}

function compose_input_data {
    if [ "$spec_run_size" = "test" ]; then
        compose_test $spec_run_case
    elif [ "$spec_run_size" = "train" ]; then
        compose_train $spec_run_case
    elif [ "$spec_run_size" = "ref" ]; then
        compose_ref $spec_run_case
    fi
}

function compose_test {
    if [ "$spec_run_case" = "400.perlbench" ]; then
        echo ",attrs.pl,gv.pl,makerand.pl,pack.pl,redef.pl,ref.pl,regmesg.pl,test.pl" >> $rundir/report.csv
    elif [ "$spec_run_case" = "401.bzip2" ]; then
        echo ",input.program,dryer.jpg" >> $rundir/report.csv
    elif [ "$spec_run_case" = "403.gcc" ]; then
        echo ",cccp.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "410.bwaves" ]; then
        echo ",410.bwaves" >> $rundir/report.csv
    elif [ "$spec_run_case" = "416.gamess" ]; then
        echo ",exam29.config" >> $rundir/report.csv
    elif [ "$spec_run_case" = "429.mcf" ]; then
        echo ",inp.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "433.milc" ]; then
        echo ",su3imp.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "434.zeusmp" ]; then
        echo ",434.zeusmp" >> $rundir/report.csv
    elif [ "$spec_run_case" = "435.gromacs" ]; then
        echo ",435.gromacs" >> $rundir/report.csv
    elif [ "$spec_run_case" = "436.cactusADM" ]; then
        echo ",benchADM.par" >> $rundir/report.csv
    elif [ "$spec_run_case" = "437.leslie3d" ]; then
        echo ",leslie3d.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "444.namd" ]; then
        echo ",namd.input" >> $rundir/report.csv
    elif [ "$spec_run_case" = "445.gobmk" ]; then
        echo ",capture.tst,connect.tst,connect_rot.tst,connection.tst,connection_rot.tst,cutstone.tst,dniwog.tst" >> $rundir/report.csv
    elif [ "$spec_run_case" = "447.dealII" ]; then
        echo ",447.dealII" >> $rundir/report.csv
    elif [ "$spec_run_case" = "450.soplex" ]; then
        echo ",test.mps" >> $rundir/report.csv
    elif [ "$spec_run_case" = "453.povray" ]; then
        echo ",SPEC-benchmark-test.ini" >> $rundir/report.csv
    elif [ "$spec_run_case" = "454.calculix" ]; then
        echo ",beampic" >> $rundir/report.csv
    elif [ "$spec_run_case" = "456.hmmer" ]; then
        echo ",bombesin.hmm" >> $rundir/report.csv
    elif [ "$spec_run_case" = "458.sjeng" ]; then
        echo ",458.sjeng" >> $rundir/report.csv
    elif [ "$spec_run_case" = "459.GemsFDTD" ]; then
        echo ",459.GemsFDTD" >> $rundir/report.csv
    elif [ "$spec_run_case" = "462.libquantum" ]; then
        echo ",462.libquantum" >> $rundir/report.csv
    elif [ "$spec_run_case" = "464.h264ref" ]; then
        echo ",foreman_test_encoder_baseline.cfg" >> $rundir/report.csv
    elif [ "$spec_run_case" = "465.tonto" ]; then
        echo ",465.tonto" >> $rundir/report.csv
    elif [ "$spec_run_case" = "470.lbm" ]; then
        echo ",reference.dat" >> $rundir/report.csv
    elif [ "$spec_run_case" = "471.omnetpp" ]; then
        echo ",omnetpp.ini" >> $rundir/report.csv
    elif [ "$spec_run_case" = "473.astar" ]; then
        echo ",lake.cfg" >> $rundir/report.csv
    elif [ "$spec_run_case" = "481.wrf" ]; then
        echo ",481.wrf" >> $rundir/report.csv
    elif [ "$spec_run_case" = "482.sphinx3" ]; then
        echo ",ctlfile" >> $rundir/report.csv
    elif [ "$spec_run_case" = "483.xalancbmk" ]; then
        echo ",test.xml" >> $rundir/report.csv
    elif [ "$spec_run_case" = "998.specrand" ]; then
        echo ",998.specrand" >> $rundir/report.csv
    elif [ "$spec_run_case" = "999.specrand" ]; then
        echo ",999.specrand" >> $rundir/report.csv
    else
        sys_info "Wrong case name!!!"
        exit -1
    fi
}

function compose_train {
    if [ "$spec_run_case" = "400.perlbench" ]; then
        echo ",diffmail.pl,perfect.pl,scrabbl.pl,splitmail.pl,suns.pl" >> $rundir/report.csv
    elif [ "$spec_run_case" = "401.bzip2" ]; then
        echo ",input.program,byoudoin.jpg,input.combined" >> $rundir/report.csv
    elif [ "$spec_run_case" = "403.gcc" ]; then
        echo ",integrate.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "410.bwaves" ]; then
        echo ",410.bwaves" >> $rundir/report.csv
    elif [ "$spec_run_case" = "416.gamess" ]; then
        echo ",h2ocu2+.energy.config" >> $rundir/report.csv
    elif [ "$spec_run_case" = "429.mcf" ]; then
        echo ",inp.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "433.milc" ]; then
        echo ",su3imp.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "434.zeusmp" ]; then
        echo ",434.zeusmp" >> $rundir/report.csv
    elif [ "$spec_run_case" = "435.gromacs" ]; then
        echo ",435.gromacs" >> $rundir/report.csv
    elif [ "$spec_run_case" = "436.cactusADM" ]; then
        echo ",benchADM.par" >> $rundir/report.csv
    elif [ "$spec_run_case" = "437.leslie3d" ]; then
        echo ",leslie3d.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "444.namd" ]; then
        echo ",namd.input" >> $rundir/report.csv
    elif [ "$spec_run_case" = "445.gobmk" ]; then
        echo ",arb.tst,arend.tst,arion.tst,atari_atari.tst,blunder.tst,buzco.tst,nicklas2.tst,nicklas4.tst" >> $rundir/report.csv
    elif [ "$spec_run_case" = "447.dealII" ]; then
        echo ",447.dealII" >> $rundir/report.csv
    elif [ "$spec_run_case" = "450.soplex" ]; then
        echo ",pds-20.mps,train.mps" >> $rundir/report.csv
    elif [ "$spec_run_case" = "453.povray" ]; then
        echo ",SPEC-benchmark-train.ini" >> $rundir/report.csv
    elif [ "$spec_run_case" = "454.calculix" ]; then
        echo ",stairs" >> $rundir/report.csv
    elif [ "$spec_run_case" = "456.hmmer" ]; then
        echo ",leng100.hmm" >> $rundir/report.csv
    elif [ "$spec_run_case" = "458.sjeng" ]; then
        echo ",458.sjeng" >> $rundir/report.csv
    elif [ "$spec_run_case" = "459.GemsFDTD" ]; then
        echo ",459.GemsFDTD" >> $rundir/report.csv
    elif [ "$spec_run_case" = "462.libquantum" ]; then
        echo ",462.libquantum" >> $rundir/report.csv
    elif [ "$spec_run_case" = "464.h264ref" ]; then
        echo ",foreman_train_encoder_baseline.cfg" >> $rundir/report.csv
    elif [ "$spec_run_case" = "465.tonto" ]; then
        echo ",465.tonto" >> $rundir/report.csv
    elif [ "$spec_run_case" = "470.lbm" ]; then
        echo ",reference.dat" >> $rundir/report.csv
    elif [ "$spec_run_case" = "471.omnetpp" ]; then
        echo ",omnetpp.ini" >> $rundir/report.csv
    elif [ "$spec_run_case" = "473.astar" ]; then
        echo ",BigLakes1024.cfg,rivers1.cfg" >> $rundir/report.csv
    elif [ "$spec_run_case" = "481.wrf" ]; then
        echo ",481.wrf" >> $rundir/report.csv
    elif [ "$spec_run_case" = "482.sphinx3" ]; then
        echo ",ctlfile" >> $rundir/report.csv
    elif [ "$spec_run_case" = "483.xalancbmk" ]; then
        echo ",allbooks.xml" >> $rundir/report.csv
    elif [ "$spec_run_case" = "998.specrand" ]; then
        echo ",998.specrand" >> $rundir/report.csv
    elif [ "$spec_run_case" = "999.specrand" ]; then
        echo ",999.specrand" >> $rundir/report.csv
    else
        sys_info "Wrong case name!!!"
        exit -1
    fi
}

function compose_ref {
    if [ "$spec_run_case" = "400.perlbench" ]; then
        echo ",checkspam.pl,diffmail.pl,splitmail.pl" >> $rundir/report.csv
    elif [ "$spec_run_case" = "401.bzip2" ]; then
        echo ",input.source,chicken.jpg,liberty.jpg,input.program,text.html,input.combined" >> $rundir/report.csv
    elif [ "$spec_run_case" = "403.gcc" ]; then
        echo ",166.in,200.in,c-typeck.in,cp-decl.in,expr.in,expr2.in,g23.in,s04.in,scilab.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "410.bwaves" ]; then
        echo ",410.bwaves" >> $rundir/report.csv
    elif [ "$spec_run_case" = "416.gamess" ]; then
        echo ",cytosine.2.config,h2ocu2+.gradient.config,triazolium.config" >> $rundir/report.csv
    elif [ "$spec_run_case" = "429.mcf" ]; then
        echo ",inp.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "433.milc" ]; then
        echo ",su3imp.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "434.zeusmp" ]; then
        echo ",434.zeusmp" >> $rundir/report.csv
    elif [ "$spec_run_case" = "435.gromacs" ]; then
        echo ",435.gromacs" >> $rundir/report.csv
    elif [ "$spec_run_case" = "436.cactusADM" ]; then
        echo ",benchADM.par" >> $rundir/report.csv
    elif [ "$spec_run_case" = "437.leslie3d" ]; then
        echo ",leslie3d.in" >> $rundir/report.csv
    elif [ "$spec_run_case" = "444.namd" ]; then
        echo ",namd.input" >> $rundir/report.csv
    elif [ "$spec_run_case" = "445.gobmk" ]; then
        echo ",13x13.tst,nngs.tst,score2.tst,trevorc.tst,trevord.tst" >> $rundir/report.csv
    elif [ "$spec_run_case" = "447.dealII" ]; then
        echo ",447.dealII" >> $rundir/report.csv
    elif [ "$spec_run_case" = "450.soplex" ]; then
        echo ",pds-50.mps,ref.mps" >> $rundir/report.csv
    elif [ "$spec_run_case" = "453.povray" ]; then
        echo ",SPEC-benchmark-ref.ini" >> $rundir/report.csv
    elif [ "$spec_run_case" = "454.calculix" ]; then
        echo ",hyperviscoplastic" >> $rundir/report.csv
    elif [ "$spec_run_case" = "456.hmmer" ]; then
        echo ",nph3.hmm,retro.hmm" >> $rundir/report.csv
    elif [ "$spec_run_case" = "458.sjeng" ]; then
        echo ",458.sjeng" >> $rundir/report.csv
    elif [ "$spec_run_case" = "459.GemsFDTD" ]; then
        echo ",459.GemsFDTD" >> $rundir/report.csv
    elif [ "$spec_run_case" = "462.libquantum" ]; then
        echo ",462.libquantum" >> $rundir/report.csv
    elif [ "$spec_run_case" = "464.h264ref" ]; then
        echo ",foreman_ref_encoder_baseline.cfg,foreman_ref_encoder_main.cfg,sss_encoder_main.cfg" >> $rundir/report.csv
    elif [ "$spec_run_case" = "465.tonto" ]; then
        echo ",465.tonto" >> $rundir/report.csv
    elif [ "$spec_run_case" = "470.lbm" ]; then
        echo ",reference.dat" >> $rundir/report.csv
    elif [ "$spec_run_case" = "471.omnetpp" ]; then
        echo ",omnetpp.ini" >> $rundir/report.csv
    elif [ "$spec_run_case" = "473.astar" ]; then
        echo ",BigLakes2048.cfg,rivers.cfg" >> $rundir/report.csv
    elif [ "$spec_run_case" = "481.wrf" ]; then
        echo ",481.wrf" >> $rundir/report.csv
    elif [ "$spec_run_case" = "482.sphinx3" ]; then
        echo ",ctlfile" >> $rundir/report.csv
    elif [ "$spec_run_case" = "483.xalancbmk" ]; then
        echo ",t5.xml" >> $rundir/report.csv
    elif [ "$spec_run_case" = "998.specrand" ]; then
        echo ",998.specrand" >> $rundir/report.csv
    elif [ "$spec_run_case" = "999.specrand" ]; then
        echo ",999.specrand" >> $rundir/report.csv
    else
        sys_info "Wrong case name!!!"
        exit -1
    fi
}

function run_a_case {
    local runscript="./run_script/${spec_run_size}/${spec_run_case}.sh"

    extract_a_file_from_tarball /home/root/run_script.tgz \
                                ${runscript} \
                                $rundir

    sys_info "start to run $spec_binary for $spec_run_case"
    cp $spec_binary $rundir
    cd $rundir
    cp $runscript .
    sys_info "running $spec_run_case for iteration: $i"
    sys_info "start time: `date +'%Y%m%d;%H%M%S'`"
    set -x
    { time -p bash $runscript $spec_binary ;} &> score.txt
    set +x
    local local_ret_code=$?
    sys_info "end of $spec_run_case for iterations: $i"
    sys_info "end time: `date +'%Y%m%d;%H%M%S'`"
    echo $local_ret_code
}

function get_ddr_latency {
    ddr_latency=50
    core_info="/home/root/CORE"
    if [[ -e "$core_info" ]];
    then
        core=`cat "$core_info"`
        core=`echo "$core" | tr '[:upper:]' '[:lower:]'`
        if [[ $core == *"x280"* || $core == *"p550"* ]];
        then
            ddr_latency=50
        elif [[ $core == *"p270"* ]];
        then
            ddr_latency=43
        else
            ddr_latency=50
        fi
    fi
}

function init {
    # create run dir
    mkdir -p $spec_base && cd $spec_base
    [[ ! -e "$spec_base/$spec_run_case" ]] && sys_info "decompressing spec2k6 workdir" \
            && tar xf /home/root/${spec_run_case}.tgz -C $spec_base

    # create golden_base
    mkdir -p $golden_base

    # set memory latency model
    # Target "CPU:cL3 1:1, cL3 4MB, 1 GHz"
    # x280: 50, p270: 43, p550: 50

    get_ddr_latency
    local LATENCY_VALUE=$ddr_latency
    #LATENCY_ADDR="/sys/devices/platform/soc/8000.memory-delay/memory_delay" # for narwhal preview1 rc1
    local LATENCY_ADDR="/sys/devices/platform/soc/180000.memory-delay/memory_delay" # for narwhal general rc1
    sys_info "ddr latency model now: `cat $LATENCY_ADDR`"
    sys_info "set ddr latency model to $LATENCY_VALUE"
    echo $LATENCY_VALUE > $LATENCY_ADDR
    sys_info "double check ddr latency model value: `cat $LATENCY_ADDR`"

    #show cl3 configuration
    sys_info "cache configuration: `devmem2 0x2010008`"
    sys_info "(should be 0x000000F)"

    #setup hugeTLB
    #TBD
    sys_info "hugeTLB not set"
}


function clean {
    # clean
    sys_info "cleaning score.txt, md5sum.out, and report.csv"
    rm -rf $rundir/score.txt*
    rm -rf $rundir/md5sum.out*
    echo -n "program,iter,ret,cmp,runtime,dataset" > $rundir/report.csv

    rm -rf $rundir/time.*
    compose_input_data $spec_run_size $spec_run_case
}

function prepare_md5sum {
    sys_info "checking result with md5sum"

    extract_a_file_from_tarball /home/root/golden_md5sum.tgz \
                                "./${golden_md5sum}" \
                                $golden_base

    cd $rundir
    cat /dev/null > md5sum.out
    cat $golden_list |cut -d\  -f3 |xargs -i md5sum {} >> md5sum.out
}

function prepare_specdiff {
    sys_info "This case need specdiff"
    #  check specdiff
    [[ ! -e "$specdiff_path" ]] && sys_info "deploying specdiff" \
                                 && tar xf $specdiff_tarball -C /home/root/
  	#  decompress golden output
    sys_info "decompressing golden output"
    tar xf /home/root/${spec_run_case}.golden.tgz -C $golden_base

    #  decompress diffcmd
    sys_info "decompressing diffcmd"
    local diffcmd_base_in_tar="./$spec_run_case/run/$case_base"

    extract_a_file_from_tarball $diffcmd_tarball \
                                "$diffcmd_base_in_tar/diffcmd_${spec_run_size}" \
                                $spec_base/run_folder
}

# main
echo $case_map |grep -w $spec_run_case &> /dev/null
[[ "$?" != "0" ]]&& echo -e $help_msg && exit -1

spec_base="/tmp/spec2k6_workspace"
case_base="run_base_${spec_run_size}_riscv_quick-eval.0000"
rundir="$spec_base/run_folder/$spec_run_case/run/$case_base"
specdiff_path="/home/root/SPEC/specdiff.sh"
specdiff_tarball="/home/root/specdiff_min.tgz"
diffcmd_tarball="/home/root/diffcmd.tgz"
golden_md5sum="${spec_run_case}/data/${spec_run_size}/output/golden_md5sum"
golden_base="/tmp/spec2k6_workspace/case_golden"
golden_list=$golden_base/${golden_md5sum}

init
clean

for i in `seq 1 $spec_run_iter`;
do
    trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT
    #run
    ret_code=`run_a_case`

    #verify result
    diff_ret=1
    if [[ `echo $complete_check_cases |grep $spec_run_case` ]];then
	      # ideally each case should go this way, but we are on 2g ram FPGA.
        prepare_specdiff

        # check output with specdiff
        cd $rundir
        bash -e diffcmd_${spec_run_size}
        diff_ret=$?
    else
        # only check md5sum of files to save ram spaces, and decomrpessing time.
        prepare_md5sum

        # check output
        diff $golden_list ./md5sum.out
        diff_ret=$?
        mv $rundir/md5sum.out $rundir/md5sum.out.$i
    fi

    [[ "$diff_ret" != "0" ]] && sys_info "Error ! miscompare to golden output !"
    score=`cat $rundir/score.txt |grep -e "user [0-9]"|sed "s/user //g"`
    sys_info "user runtime: $score"

    input_data_times=`tr -d '\n' < time.txt`

    # move output and score for iterations
    mv $rundir/score.txt $rundir/score.txt.$i

	# move input data times for iterations
    mv $rundir/time.txt $rundir/time.txt.$i

    # generate report
    echo "$spec_run_case,$i,$ret_code,$diff_ret,$score,$spec_run_size $input_data_times" \
                                                          >> $rundir/report.csv

    #end of 1 iteration
    echo -e "\n"
    
done

sys_info "show report"
echo "==== benchmark report ($rundir/report.csv) ===="
cat $rundir/report.csv
echo "==== end of benchmark report ===="
exit 0

