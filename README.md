# Assembly Methods

## Pre-assembly 

Symbolic links from for 4 sub-directories were created to import data to be used for transcriptome assembly. The 4 sub-directories were /Paired, /Unpaired, /sam, and /bam. These originated from the module-06-victoria-r/RNA-Seq directory. This data contains a short read alignment for the Aiptasia genome. 

# Outline

Trinity [1] was used to run both reference-guided and de-novo assemblies. For the reference-guided assembly, only a single sorted bam file can be used. To meet this requirement, all samples in the /bam directory that incude Aip were merged into a single bam file using samtools [2] merge to create AipAll.bam. This was done in the mergeAll.sh script. The transcriptome was then assembled from the merged bam file reads using Trinity [1]. This was done using the parameters with a maximum intron separation of 10000 and a maximum memory of CPU 4. The --genome_guided_bam parameter was also pulled to tell Trinity that this is a genome-guided assembly. This was done using the runTrinit.sh script, creating a trinity_out_dir containg a fasta file called Trinity-GG.fasta. This fasta file is the transcriptome assembly. To check assembly statistics run TrinityStats.pl with the assembled transcriptome fasta file. This will be done in the analyzeTrinity.sh script. The output will show the size of the assembled contigs for this transcriptome. The numbers, such as N20 or N50, indicate the length of distribution for this assembly. Special importance is given to the length N50. This number is found when the contigs are sorted from longest to shortest. A horizontal line is placed where 50% of all the assembled bases are above the line and 50% are below the line. The contig at this middle intersecting point is called N50. With the /Paired and directory contents, a de-novo assembly was created with the script trinityDeNovo1.sh. This script will give an ouput of a list of left and right reads. This script will then be copied as trinityDeNovo.sh. The Trinity de-novo assembly command from Trinity help was added to the bottom of the copied script. An output directory, trinity_de-novo, was specified to prevent overwriting the genome-guided assembly. The variable $leftReads was passed for -left, $rightReads for -right, and ran on 4CPUs. To check the assembly statistics the same script used in analyzeTrinity.sh was copied as analyzeTrinityDeNovo.sh and the output files were renamed as trinity_de-novo and Trinity.fasta.   

## N50 Comparison

The first N50 output was 572 compared to the second output which was 607. The contigs were a bit longer in the second run becaue the Trinity de-novo assembly command was used, making it more accurate. 

# References

1. Grabherr MG, Haas BJ, Yassour M, Levin JZ, Thompson DA, Amit I, Adiconis X, Fan L, Raychowdhury R, Zeng Q, Chen Z, Mauceli E, Hacohen N, Gnirke A, Rhind N, di Palma F, Birren BW, Nusbaum C, Lindblad-Toh K, Friedman N, Regev A. Full-length transcriptome assembly from RNA-seq data without a reference genome. Nat Biotechnol. 2011 May 15;29(7):644-52. doi: 10.1038/nbt.1883. PubMed PMID: 21572440.

2. Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., & Durbin, R. (2009). The Sequence Alignment/Map format and SAMtools. Bioinformatics, 25(16), 2078–2079. https://doi.org/10.1093/bioinformatics/btp352
       
