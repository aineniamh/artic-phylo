rule initial_check:
    output:
        
    shell:
        #Looks for new sequences in consensus folder. 
        #Check for duplicates, mislabelled.:

rule whoami:
    input:
    output:
    shell:
    #Looks up id in metadata table
        # Construct sequence label  

rule cat_seq_and_ref: #maybe parasail?
    input:
        cns="consensus/{barcode}.cns.fasta",
        ref="references/EBOV.reference.fasta"
    output:
        "gathered/{barcode}.nt.fasta"
    run:
        comp=str(output[0])
        sample=comp.rstrip(".fasta").lstrip("pwise_aligned/")
        with open(comp, "w") as fw:
            cns=str(input.cns1)
            ref=str(input.ref)
            for record in SeqIO.parse(cns,"fasta"):
                fw.write(">{}|{}\n{}\n".format(record.id,sample,record.seq))
            for record in SeqIO.parse(ref,"fasta"):
                fw.write(">{}\n{}\n".format(record.id, record.seq))

rule align_to_closest_ref:
    input:
        "pwise_aligned/{barcode}.fasta"
    output:
        "pwise_aligned/{barcode}.aln.fasta"
    shell:
        "mafft {input} > {output}"
        
rule divergence_check:
    input:
    output:
    shell:

rule recombination_check
    input:
    output:
    shell:

rule adar_check:
    input:
    output:
    shell:
        # - QC: look for ADAR, APOBEC?

rule orf_check:
    input:
    output:
    shell:
        #insertions removed, deletions padded?
        #- QC: look for in-frame stop codons

rule extract_features:
    input:
        seqs=expand(barcode)
    output:
        features=expand(genes)
    shell:
    # Extracts genome features into separate files

