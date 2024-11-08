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


# Creating or clearing the report file
> "baseline_model_report.md"  # Clears the file if it exists

# Writing into the created file and configuring PNG for remote repo

cat <<EOT >> baseline_model_report.md

# Baseline Model Evaluation

 * Model: ${model}
 * Data Version: ${version}

# Metrics

 * F1-Score: ${f1}
 * Recall: ${recall}
 * Precision: ${precision}
 * ROC-AUC: ${roc}


![Confusion matrix](report/data${version}_${model}_confusion_matrix.png) 


EOT

echo "Report generated and saved as baseline_model_report.md"

