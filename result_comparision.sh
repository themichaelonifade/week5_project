#!/bin/bash

# Setting paths
directory="/c/Users/Victoria/TDI_DS/my_repos/week5_project/report"
filepath="${directory}/baseline_model_results.csv"

# Extracting and declaring variables
model=$(sort -t ',' -k 5 -rg "$filepath" | sed '1q' | cut -d ',' -f2)
version=$(sort -t ',' -k 5 -rg "$filepath" | sed '1q' | cut -d ',' -f1)
f1=$(sort -t ',' -k 5 -rg "$filepath" | sed '1q' | cut -d ',' -f5)
recall=$(sort -t ',' -k 5 -rg "$filepath" | sed '1q' | cut -d ',' -f4)
precision=$(sort -t ',' -k 5 -rg "$filepath" | sed '1q' | cut -d ',' -f3)
roc=$(sort -t ',' -k 5 -rg "$filepath" | sed '1q' | cut -d ',' -f6)

# Locating the appropriate PNG by filtering the title
image=$(find "$directory" -type f -name "*.png" | grep "$model" | grep "$version" | head -n 1)
image_generated="![Confusion matrix]($image)"

# Creating the report file
touch "${directory}/baseline_model_report.md"

# Writing into the created file
cat <<EOT >> "${directory}/baseline_model_report.md"

# Baseline Model Evaluation

 * Model: ${model}
 * Data Version: ${version}

# Metrics

 * F1-Score: ${f1}
 * Recall: ${recall}
 * Precision: ${precision}
 * ROC-AUC: ${roc}

$image_generated

EOT

echo "Report generated and saved"

