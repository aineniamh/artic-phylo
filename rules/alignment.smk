# going to start here with a file for each feature (gene, intergenic)
    # Multiple alignment with previous sequences
    #     - translation align for ORFs
    #     - profile alignment? occasional full alignment?


rule translate:
    input:
    output:
    shell:

rule amino_acid_align:
    input:
        {gene}
    output:
    shell:
        "mafft {input} > {output}"

rule process_alignment_to_nt:
    input:
        {gene}
    output:
    shell:
    "python scripts/"

rule construct_genome_alignment:
    input:
        expand()
    output:
        {run_name}.aln.fasta
    run:
        # cat alignments together
    # Construct full genome alignment with coordinate file

