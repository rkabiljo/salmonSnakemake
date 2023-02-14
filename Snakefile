configfile: "config.yaml"

fastqPath = "/scratch/prj/herv_project/Brainbank/rnaseq/run1/"
outPath = config["outPath"]

rule all:
    input:
        expand("/scratch/prj/alstargets/HG38Salmon/quant/{sample}/{sample_s}/quant.sf",zip, sample=config["SAMPLES"], sample_s=config["SAMPLES_WITH_S_NUM"])

rule salmon:
    input:
        fastqPath + "Sample_{sample}/{sample_s}_R1_001.fastq.gz",
        fastqPath + "Sample_{sample}/{sample_s}_R2_001.fastq.gz"
    output:
        "/scratch/prj/alstargets/HG38Salmon/quant/{sample}/{sample_s}/quant.sf" 
        #"/scratch/prj/alstargets/HG38Salmon/quant/{sample}/quant.sf" 
    shell:
        """
        salmon quant -i /scratch/prj/alstargets/HG38Salmon/salmon_index_HSfullP13 \
        -l A \
        -1 {input[0]} \
        -2 {input[1]} \
        --seqBias \
        --gcBias \
        --useVBOpt \
        --validateMappings \
        -p 10 \
        -o /scratch/prj/alstargets/HG38Salmon/quant/{wildcards.sample}/{wildcards.sample_s}
        cp /scratch/prj/alstargets/HG38Salmon/quant/{wildcards.sample}/{wildcards.sample_s}/quant.sf /scratch/prj/alstargets/HG38Salmon/quant/{wildcards.sample}.quant.sf
        """
      
