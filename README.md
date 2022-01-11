# What is 3D-Scere ?

3D-Scere is an open-source tool for interactive visualization and exploration. Source code is available here. The tool is also freely usable online at https://3d-scere.ijm.fr/. It allows the visualization of any list of genes in the context of the 3D model of S. cerevisiae genome. Further information can easily be added, like functional annotations (GO terms) or gene expression measurements. Qualitative or quantitative functional properties are highlighted in the large-scale 3D context of the genome with only a few mouse clicks.

# SCERE database

## Setup your environment

Clone the repository:
```
git clone https://github.com/Thibault-Poinsignon/scere_explore.git
```

Move to the new directory:
```
cd scere_explore
```

Create a [conda](https://docs.conda.io/en/latest/miniconda.html) environment:
```
conda env create -f binder/environment.yml
```

Load the `scere` conda environment:
```
conda activate scere
```

Activate Jupyter lab extensions:
```
bash binder/postBuild
```

Optionally, install DB Browser for SQLite with `apt`:
```
grep -vE '^#' binder/apt.txt | xargs sudo apt install -y
```



## Build the SCERE database

Download data and associated `.README` files from the [SGD database](https://www.yeastgenome.org/):
```
bash download_SGD_data.sh
```

Clean the SGD data:
```
bash clean_data.sh
```

Create database and tables:
```
sqlite3 SCERE.db < schema_scere.sql
```

Import data from the SGD:
```
sqlite3 SCERE.db < import_SGD_data_to_tables.sql
```

The database file `SCERE.db` can be open with [DB Browser for SQLite](https://sqlitebrowser.org/).

## Get the 3D coordinates

```
bash download_3D_coordinated_Data.sh
```
