
#####Clean_data#####

set -euo pipefail 

#Unip the gene_association.sgd file
gzip -d ./SGD_data/gene_association.sgd.gaf.gz

#Suppress the comments lines (starting by !) at the beginning of 'gene_association.sgd.gaf'
sed -i '/^!/d' ./SGD_data/gene_association.sgd.gaf

#Suppress the " symbols in phenotype_data.tab
sed -i s/\"//g ./SGD_data/phenotype_data.tab

#Supress the column name row in protein_properties.tab
sed -i '1d' ./SGD_data/protein_properties.tab
