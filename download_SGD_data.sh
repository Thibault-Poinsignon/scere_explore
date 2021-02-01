
#####SGD_data#####

mkdir SGD_data
cd SGD_data

wget http://sgd-archive.yeastgenome.org/curation/chromosomal_feature/SGD_features.tab
wget http://sgd-archive.yeastgenome.org/curation/chromosomal_feature/chromosome_length.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/biochemical_pathways.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/gene_literature.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/interaction_data.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/phenotype_data.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/go_terms.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/go_slim_mapping.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/go_protein_complex_slim.tab
wget http://sgd-archive.yeastgenome.org/curation/literature/gene_association.sgd.gaf.gz
wget http://sgd-archive.yeastgenome.org/curation/chromosomal_feature/dbxref.tab
wget http://sgd-archive.yeastgenome.org/curation/calculated_protein_info/protein_properties.tab

cd ..
