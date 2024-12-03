import os
from glob import glob

# Base URL for the links
base_url = (
    "https://colab.research.google.com/github/Erland366/unsloth-notebooks/blob/master/"
)

# Get all .ipynb files
paths = glob(os.path.join("notebooks", "*", "*.ipynb"))

# Generate Markdown table
table_header = "| Notebook | Link |\n| --- | --- |\n"
table_rows = ""

for path in paths:
    notebook_name = os.path.basename(path)
    notebook_link = base_url + path
    table_rows += f"| {notebook_name} | [Open in Colab]({notebook_link}) |\n"

# Combine header and rows
markdown_table = table_header + table_rows

# Print the Markdown table
print(markdown_table)
