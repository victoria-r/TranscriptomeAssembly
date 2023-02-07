#!/usr/bin/env bash
# runTrinity.sh

nice -n19 /usr/local/programs/trinityrnaseq-Trinity-v2.8.4/Trinity \
--genome_guided_bam bam/AipAll.bam \
--genome_guided_max_intron 10000 \
--max_memory 10G --CPU 4 \
1>trinity.log 2>trinity.err & 
