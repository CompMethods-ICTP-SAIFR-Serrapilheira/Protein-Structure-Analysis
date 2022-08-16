#This is the code of the Scientific Programmimg Project
#Author: Thales A. de M. Fernandes
#Date: 2022-08-15
#Title: Structure search and selection

#Packages-----------------------------------------------------------------------
library(bio3d)

#Structure search and selection-------------------------------------------------

aa <- get.seq("1L3R_E", outfile = "~/project/data/raw/seqs.fasta") #Obtain the protein sequence

blast <- blast.pdb(aa) #find similar sequences using BLAST sequence alignment algorithm

hits <- plot(blast) #Plot the BLAST results

annotation <- pdb.annotate(hits) #Annotate the BLAST results into the variable "annotation"

pdb.id <- with(annotation, subset(hits$pdb.id,resolution<=3)) #Filtering structures by resolution < 3

files <- get.pdb(pdb.id, path="~/project/data/raw", split=TRUE) #Download protein structures and split into single chains


