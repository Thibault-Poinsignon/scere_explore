#!/usr/bin/env bash

wget -P data/3D_coordinates https://noble.gs.washington.edu/proj/yeast-architecture/figures/3dfigures/3dmodel.pdb

sed 's/ \{1,\}/,/g' data/3D_coordinates/3dmodel.pdb > data/3D_coordinates/3dmodel.csv
