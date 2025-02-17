# BAM Coverage and Gaps Analysis

## Overview
This Bash script processes BAM files to generate coverage data and extract gap regions where coverage is zero. It automates the process using `samtools` and `awk`, saving the results in structured output directories.

## Features
- Processes all `.bam` files in a specified folder.
- Generates coverage files using `samtools depth`.
- Extracts gap regions (coverage = 0).
- Converts gap data into BED format.
- Organizes results into sample-specific directories.

## Prerequisites
Ensure the following dependencies are installed:
- `samtools`
- `awk`
- `bash` (Linux/macOS environment recommended)
- `IGV` (for visualization)

## Installation
Clone the repository:
```bash
git clone https://github.com/yourusername/bam-gap-analysis.git
cd bam-gap-analysis
```

## Usage
Run the script and provide the necessary paths when prompted:
```bash
chmod +x bam-gap-analysis.sh
./bam-gap-analysis.sh
```
You will be asked to enter:
1. The path to the folder containing BAM files.
2. The output folder path where results will be saved.

## Output
For each BAM file, a separate folder is created in the output directory containing:
- `sample_coverage.txt`: Coverage depth at each position.
- `sample_gaps.txt`: List of positions with zero coverage.
- `sample_gaps.bed`: Gap regions formatted in BED format.

## Example Output Structure
```
output_directory/
├── sample1/
│   ├── sample1_coverage.txt
│   ├── sample1_gaps.txt
│   ├── sample1_gaps.bed
├── sample2/
│   ├── sample2_coverage.txt
│   ├── sample2_gaps.txt
│   ├── sample2_gaps.bed
```

## Visualization in IGV
To visualize the BAM files and gaps in IGV:
1. Open IGV.
2. Load the reference genome corresponding to the BAM files.
3. Upload the BAM file (`sample.bam`) and its index file (`sample.bam.bai`).
4. Upload the `sample_gaps.bed` file to visualize gap regions.
5. Inspect coverage and gaps in the genome browser.

