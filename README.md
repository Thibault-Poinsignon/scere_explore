# SCERES database

## Setup your environment

Clone the repository:
```
git clone https://github.com/Thibault-Poinsignon/sceres_database.git
```

Move to the new directory:
```
cd sceres_database
```

Create a [conda](https://docs.conda.io/en/latest/miniconda.html) environment:
```
conda env create -f binder/environment.yml
```

Install remaining packages with `apt`:
```
grep -vE '^#' binder/apt.txt | xargs sudo apt install -y
```

Load the conda env:
```
conda activate sceres
```


## Build the SCERES database


Download data and associated `.README` files from the SGD database:
```
bash download_SGD_data.sh
```

Clean the SGD data:
```
bash clean_data.sh
```

Create database and tables:
```
sqlite3 SCERES.db < schema_sceres.sql
```

Import data from the SGD:
```
sqlite3 SCERES.db < import_SGD_data_to_tables.sql
```

The database file `SCERES.db` can be open with [DB Browser for SQLite ](https://sqlitebrowser.org/).
