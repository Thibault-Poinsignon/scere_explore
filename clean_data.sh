set -euo pipefail 

# Unip the gene_association.sgd file
gzip -d ./data/SGD/gene_association.sgd.gaf.gz

# Suppress the comments lines (starting by !) at the beginning of 'gene_association.sgd.gaf'
sed -i '/^!/d' ./data/SGD/gene_association.sgd.gaf

# Suppress the " symbols in phenotype_data.tab
sed -i s/\"//g ./data/SGD/phenotype_data.tab

# Suppress the column name row in protein_properties.tab
sed -i '1d' ./data/SGD/protein_properties.tab
