# SCERES database

## How to create the SCERES database ?

1- Download the .sh and .sql scripts in your working directory, where you want the database to be.

2- Open a terminal in the same directory.

3- Execute the following command lines :

```
./download_SGD_data.sh
```
Download the data from the SGD database.

```
./download_SGD_readme.sh
```
Download the associated readme files.

```
sqlite3 SCERES.db < schema_sceres.sql
```
Create the database and the SGD tables.

```
gzip -d ./SGD_data/gene_association.sgd.gaf.gz
sed -i '/^!/d' ./SGD_data/gene_association.sgd.gaf
sed -i s/\"//g ./SGD_data/phenotype_data.tab
sed -i '1d' protein_properties.tab
```
The sed commands suppress :
	- the ! comments lines at the beginning of 'gene_association.sgd.gaf'
	- the " symbols in phenotype_data.tab
	- the column name row in protein_properties.tab

```
sqlite3 SCERES.db < import_SGD_data_to_tables.sql
```
Import the data from the .tab files into SCERES tables.

The database file "SCERES.db" can be open with DB browser.
