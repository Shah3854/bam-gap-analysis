#!/bin/bash

# Prompt for input and output directories
read -p "Enter the BAM file folder path: " BAM_DIR
read -p "Enter the output folder path: " OUTPUT_DIR

# Create output directory if not exists
mkdir -p "$OUTPUT_DIR"

# Process each BAM file in the input folder
for bam_file in "$BAM_DIR"/*.bam; do
    # Extract sample name (prefix before .bam)
    sample_name=$(basename "$bam_file" .bam)

    # Create sample-specific output directory
    sample_output="$OUTPUT_DIR/$sample_name"
    mkdir -p "$sample_output"

    echo "Processing $sample_name..."

    # Step 1: Generate coverage file
    samtools depth -a "$bam_file" > "$sample_output/${sample_name}_coverage.txt"

    # Step 2: Extract gap regions (coverage = 0)
    awk '$3==0 {print $1, $2, $3}' "$sample_output/${sample_name}_coverage.txt" > "$sample_output/${sample_name}_gaps.txt"

    # Step 3: Convert gaps to BED format
    awk 'BEGIN {start=0; prev=0; chr=""} 
         $3==0 {if (start==0) {start=$2; chr=$1} prev=$2} 
         $3>0 && start!=0 {print chr, start, prev; start=0}' "$sample_output/${sample_name}_coverage.txt" > "$sample_output/${sample_name}_gaps.bed"

    echo "Finished processing $sample_name."
done

echo "All BAM files processed. Results saved in $OUTPUT_DIR."

write a readme.md for github
