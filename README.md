# SCERES database


##Conda environment

Create a conda environment from the .yml file in the repository.
```
conda env create -f environment.yml
```

## How to create the SCERES database ?

1- Clone the repository in your working directory:
git clone https://github.com/Thibault-Poinsignon/sceres_database.git

3- Execute the following command lines :

Download the data the associated readme files from the SGD database.
```
bash download_SGD_data.sh
```

Create the database and the SGD tables.
```
sqlite3 SCERES.db < schema_sceres.sql
```

Clean the SGD data.
```
bash clean_data.sh
```

Import the data from the .tab files into SCERES tables.
```
sqlite3 SCERES.db < import_SGD_data_to_tables.sql
```

The database file "SCERES.db" can be open with DB browser https://sqlitebrowser.org/.
