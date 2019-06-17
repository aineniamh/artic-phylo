import os
import collections
from Bio import SeqIO

configfile: "config.yaml"
run_name = str(config["run_name"])
##### Target rules #####

rule all:
    input:
        expand("phylo_output/{barcode}.fasta",barcode=config["barcodes"])

##### Modules #####
include: "rules/gather.smk"

onstart:
    print("Setting up the artic package")
    shell("cd fieldbioinformatics && python setup.py install")
    shell("export PATH=$PATH:`pwd`/artic")
    shell("cd .. ")
