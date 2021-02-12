
-----Schema_SCERE-----

CREATE TABLE SGD_features(
  Primary_SGDID TEXT PRIMARY KEY,
  Feature_type TEXT NOT NULL,
  Feature_qualifier TEXT,
  Feature_name TEXT,
  Standard_gene_name TEXT,
  Alias TEXT,
  Parent_feature_name TEXT,
  Secondary_SGDID TEXT,
  Chromosome TEXT,
  Start_coordinate INTEGER,
  Stop_coordinate INTEGER,
  Strand TEXT,
  Genetic_position REAL,
  Coordinate_version TEXT,
  Sequence_version TEXT,
  Description TEXT);

--Parent ?

CREATE TABLE chromosome_length(
  chromosome TEXT,
  NCBI_RefSeq_accession_number TEXT,
  length     INTEGER,
  FOREIGN KEY(chromosome) REFERENCES SGD_features(Chromosome) ON DELETE SET NULL
);


CREATE TABLE biochemical_pathways(
  biochemical_pathway_common_name TEXT,
  enzyme_name TEXT,
  EC_number_of_reaction TEXT,
  Gene_name   TEXT,
  reference   TEXT,
  FOREIGN KEY(Gene_name) REFERENCES SGD_features(Standard_gene_name) ON DELETE SET NULL
);

CREATE TABLE gene_literature(
  PubMed_ID   INTEGER,
  citation    TEXT,
  gene_name   TEXT,
  feature     TEXT,
  literature_topic TEXT NOT NULL,
  SGDID       TEXT NOT NULL,
  FOREIGN KEY(SGDID) REFERENCES SGD_features(Primary_SGDID) ON DELETE SET NULL
);


CREATE TABLE dbxref(
  DBXREF_ID   TEXT NOT NULL,
  DBXREF_ID_source TEXT NOT NULL,
  DBXREF_ID_type TEXT NOT NULL,
  Feature_name TEXT NOT NULL,
  SGDID       TEXT NOT NULL,
  Gene_name   TEXT,
  FOREIGN KEY(SGDID) REFERENCES SGD_features(Primary_SGDID) ON DELETE SET NULL
);

--"Feature_name" <--> "S. cerevisiae feature name" field in dbxref.tab

CREATE TABLE phenotypes(
  Feature_Name TEXT NOT NULL,
  Feature_Type TEXT NOT NULL,
  Gene_Name    TEXT,
  SGDID        TEXT NOT NULL,
  Reference    TEXT,
  Experiment_Type TEXT NOT NULL,
  Mutant_Type  TEXT NOT NULL,
  Allele       TEXT,
  Strain_Background TEXT,
  Phenotype    TEXT NOT NULL,
  Chemical     TEXT,
  Condition    TEXT,
  Details      TEXT,
  Reporter     TEXT,
  FOREIGN KEY(SGDID) REFERENCES SGD_features(Primary_SGDID) ON DELETE SET NULL
);


CREATE TABLE interactions(
  Feature_Name_Bait TEXT NOT NULL,
  Standard_Gene_Name_Bait TEXT,
  Feature_Name_Hit  TEXT NOT NULL,
  Standard_Gene_Name_Hit TEXT,
  Experiment_Type   TEXT NOT NULL,
  Genetic_or_Physical_Interaction TEXT NOT NULL,
  Source TEXT NOT NULL,
  Manually_curated_or_High_throughput TEXT NOT NULL,
  Notes  TEXT,
  Phenotype         TEXT,
  Reference         TEXT NOT NULL,
  Citation          TEXT NOT NULL,
  FOREIGN KEY(Feature_Name_Bait) REFERENCES SGD_features(Feature_name) ON DELETE SET NULL
  FOREIGN KEY(Feature_Name_Hit) REFERENCES SGD_features(Feature_name) ON DELETE SET NULL
);

CREATE TABLE protein_properties(
  ORF            TEXT NOT NULL,
  Mw             REAL,
  PI             REAL,
  Protein_Length REAL,
  N_term_seq     TEXT,
  C_term_seq     TEXT,
  GRAVY_Score    REAL,
  Aromaticity_Score REAL,
  CAI            REAL,
  Codon_Bias     REAL,
  FOP_Score      REAL,
  Ala            REAL,
  Cys            REAL,
  Asp            REAL,
  Glu            REAL,
  Phe            REAL,
  Gly            REAL,
  His            REAL,
  Ile            REAL,
  Lys            REAL,
  Leu            REAL,
  Met            REAL,
  Asn            REAL,
  Pro            REAL,
  Gln            REAL,
  Arg            REAL,
  Ser            REAL,
  Thr            REAL,
  Val            REAL,
  Trp            REAL,
  Tyr            REAL,
  CARBON         REAL,
  HYDROGEN       REAL,
  NITROGEN       REAL,
  OXYGEN         REAL,
  SULPHUR        REAL,
  INSTABILITY_INDEX  REAL,
  ALL_CYS_HALF_CYS   REAL,
  NO_CYS_HALF_CYS    REAL,
  ALIPHATIC_INDEX    REAL
);


--Headlines ?? ORF = Gene name + unknown ?


CREATE TABLE gene_associations(
  DB                TEXT,
  SGDID             TEXT,
  DB_Object_Symbol  TEXT,
  Qualifier         TEXT,
  GO_ID             TEXT,
  DB_reference      TEXT,
  Evidence          TEXT,
  With_or_from      TEXT,
  Aspect            TEXT,
  DB_object_name    TEXT,
  DB_object_synonym TEXT,
  DB_object_type    TEXT,
  Taxon             TEXT,
  Annotation_date   TEXT,
  Assigned_b        TEXT,
  gene_name         TEXT,
  FOREIGN KEY(SGDID) REFERENCES SGD_features(Primary_SGDID) ON DELETE SET NULL
);

--Why gene names in column 16 ? Not in README file

CREATE TABLE go_terms(
  GO_ID              TEXT NOT NULL,
  GO_term            TEXT NOT NULL,
  GO_aspect          TEXT NOT NULL,
  GO_term_definition TEXT,
  FOREIGN KEY(GO_ID) REFERENCES gene_associations(GO_ID) ON DELETE SET NULL
);


CREATE TABLE go_slim_mapping(
  ORF            TEXT NOT NULL,
  Gene           TEXT,
  SGDID          TEXT NOT NULL,
  GO_aspect      TEXT NOT NULL,
  GO_slim_term   TEXT NOT NULL,
  GO_ID          TEXT,
  Feature_tpe    TEXT NOT NULL,
  FOREIGN KEY(GO_ID) REFERENCES gene_associations(GO_ID) ON DELETE SET NULL
  FOREIGN KEY(SGDID) REFERENCES SGD_features(Primary_SGDID) ON DELETE SET NULL
);
