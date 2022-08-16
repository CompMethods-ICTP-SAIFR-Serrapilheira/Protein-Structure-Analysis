#This is the code of the Scientific Programmimg Project
#Author: Thales A. de M. Fernandes
#Date: 2022-08-15
#Title: Structure fitting and analysis

#Packages-----------------------------------------------------------------------
library(bio3d)


#Structure superimposing--------------------------------------------------------

#Identifying structure invariant core

cores <- core.find(pdbs)

#Fitting

xyz <- pdbfit(pdbs, inds=cores)
