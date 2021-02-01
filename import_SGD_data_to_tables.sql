
-----Import_SGD_data-----

.mode csv
.separator "\t"
.import ./SGD_data/SGD_features.tab SGD_features
.import ./SGD_data/chromosome_length.tab chromosome_length
.import ./SGD_data/biochemical_pathways.tab biochemical_pathways
.import ./SGD_data/gene_literature.tab gene_literature
.import ./SGD_data/dbxref.tab dbxref
.import ./SGD_data/phenotype_data.tab phenotypes
.import ./SGD_data/interaction_data.tab interactions
.import ./SGD_data/protein_properties.tab protein_properties
.import ./SGD_data/gene_association.sgd.gaf gene_associations
.import ./SGD_data/go_terms.tab go_terms
.import ./SGD_data/go_slim_mapping.tab go_slim_mapping
