#This is the code of the Scientific Programmimg Project
#Author: Thales A. de M. Fernandes
#Date: 2022-08-15
#Title: Exploratory data analysis of protein structure and sequence

#Packages-----------------------------------------------------------------------
library(bio3d)

#Read a PDB file ----------------------------------------------------------------
pdb <- read.pdb("4q21")

print(pdb)

attributes(pdb)

head(pdb$atom)

pdb$atom[1:2, ] #Print $atom data for the first two atoms

pdb$atom[1:2, c("eleno", "elety", "x","y","z")] # Print a subset of $atom data for the first two atoms

plot.bio3d(pdb$atom$b[pdb$calpha], sse=pdb, typ="l", ylab="B-factor") #Plotting the B-factor

#Atom selection ----------------------------------------------------------------

ca.inds <- atom.select(pdb, "calpha") #Selecting all C-alpha atoms
ca.inds

head( pdb$atom[ca.inds$atom, ]) #Print details of the first few selected atoms

head( pdb$xyz[, ca.inds$xyz]) #Selecting xyz coordingates

#Write a PDB object ------------------------------------------------------------

b.inds <- atom.select(pdb, "back") #selecting the backbone atoms
backpdb <- trim.pdb(pdb, b.inds) #creating a new object containing only the backbone atoms
write.pdb(backpdb, file="~/project/data/processed/4q21_back.pdb") #write a .PDB file

#Concatenate Multiple PDB files ------------------------------------------------

a <- read.pdb("4q21")
b <- read.pdb("4lhy")

a1 <- trim.pdb(a, chain="A")
b1 <- trim.pdb(b, chain="A")
b2 <- trim.pdb(b, chain="E")
b3 <- trim.pdb(b, chain="F")

new <- cat.pdb(a1, b1, b2, b3, rechain=TRUE) # concatenate PDBs
unique(new$atom$chain)

write.pdb(new, file="~/project/data/processed/4Q21-4LHY.pdb") # write new PDB object to file

#Binding Site Identification ---------------------------------------------------

pdb <- read.pdb("4q21")
bs <- binding.site(pdb)
print(bs$resnames)

#Identification of dynamic domains ---------------------------------------------
pdb <- read.pdb("1d1d", multi=TRUE) # Read multi-model PDB file
gs <- geostas(pdb)
plot(gs)
