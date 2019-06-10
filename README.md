# artic-phylo
Semi-automatic pipeline replacing Andrew Rambaut. 

## brief description
A semi-automatic snakemake pipeline for running phylogenetic analysis. Takes in consensus fasta sequences from viral outbreak samples, runs through alignment and tree generation, optionally using IQTree or BEAST. There are many QC steps built into the pipeline and each step produces a log file. Report summary can be visualised using XXX.

> *Recommendation:* See the artic.network bioinformatics SOP to generate the consensus sequences. 

## setup

Although not a requirement, an install of conda will make the setup of this pipeline on your local machine much more streamlined. I have created an ``artic-phylo`` conda environment which will allow you to access all the software required for the pipeline to run. To install conda, visit here https://conda.io/docs/user-guide/install/ in a browser. 

> *Recommendation:* Install the `64-bit Python 3.6` version of Miniconda

Once you have a version of conda installed on your machine, clone this repository by typing into the command line:

```bash
git clone https://github.com/aineniamh/artic-phylo.git
```

Build the conda environment by typing:

```bash
conda env create -f artic-phylo/envs/artic-phylo.yaml
```

To activate the environment, type:

```bash
source activate artic-phylo
```

To deactivate the environment, enter:

```bash
conda deactivate
```

## running the pipeline

To start the pipeline, in a terminal window in the artic-phylo directory, simply enter:

```bash
snakemake
```

If you wish to run your pipeline using more than one core (**recommended**), enter:

```bash
snakemake --cores X
```

where X is the number of threads you wish to run.

