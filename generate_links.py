import os
from glob import glob

# Base URLs for the links
base_url_colab = (
    "https://colab.research.google.com/github/Erland366/unsloth-notebooks/blob/master/"
)
base_url_kaggle = "https://www.kaggle.com/notebooks/welcome?src=https://github.com/Erland366/unsloth-notebooks/blob/master/"

# Get all .ipynb files
paths = glob(os.path.join("notebooks", "*", "*.ipynb"))

# Generate Markdown table
table_header = "| Notebook | Link |\n| --- | --- |\n"
table_rows_colab = ""
table_rows_kaggle = ""

for path in paths:
    notebook_name = os.path.basename(path)
    if "kaggle" in path.lower():
        notebook_link = base_url_kaggle + path + "&accelerator=nvidiaTeslaT4"
        table_rows_kaggle += (
            f"| {notebook_name} | [Open in Kaggle]({notebook_link}) |\n"
        )
    else:
        notebook_link = base_url_colab + path
        table_rows_colab += f"| {notebook_name} | [Open in Colab]({notebook_link}) |\n"

# Combine header and rows
markdown_table_colab = table_header + table_rows_colab
markdown_table_kaggle = table_header + table_rows_kaggle

# Print the Markdown tables
print("## Colab Notebooks\n")
print(markdown_table_colab)
print("\n## Kaggle Notebooks\n")
print(markdown_table_kaggle)
