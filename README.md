# salmonSnakemake
run salmon as a snakemake pipeline, on create
This code is here in Create: /scratch/prj/alstargets/HG38Salmon/snakemakeSalmon

## Prerequisites
Salmon index, see my repo how to prepare it prepareSalmon

## Install salmon
I have added salmon to the snakemake conda environment

```
conda install -n snakemake salmon
```

Now when snakemake is activated with
```
conda activate snakemake
```
it will include salmon


## Run snakemake

```
nohup snakemake --cores 20 --jobs 20 --cluster "sbatch -p nd_bioinformatics_cpu --mem-per-cpu=30G --ntasks=10"
```

