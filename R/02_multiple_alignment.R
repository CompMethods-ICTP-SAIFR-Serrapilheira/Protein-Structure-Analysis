#This is the code of the Scientific Programmimg Project
#Author: Thales A. de M. Fernandes
#Date: 2022-08-15
#Title: Multiple Sequence Aligment

#Packages-----------------------------------------------------------------------
library(bio3d)


#MUltiple Sequence Aligment-----------------------------------------------------

#Align structures

pdbs <- pdbaln(files, outpath = "~/project/data/processed", outfile = "aln.fa")


#Plot

plot(pdbs)

