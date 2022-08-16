#This is the code of the Scientific Programmimg Project
#Author: Thales A. de M. Fernandes
#Date: 2022-08-15
#Title: Principal Component Analysis

#Packages-----------------------------------------------------------------------
library(bio3d)


#PCA----------------------------------------------------------------------------

#Applying PCA for the aligned and non-gaped structures

pc <- pca(xyz, rm.gaps=TRUE)

#Structure clustering in the PC1-PC2 plane

d <- dist(pc$z[, 1:2]) #Specifying the PCs
hc <- hclust(d) #Clustering
hclustplot(hc, k=2, labels=pdb.id) #Plotting the clustering
grps <- cutree(hc, k=2)


#Generate conformer plot, scree plot, and residue loadings plot

plot(pc, col=grps) #Plotting the PCA
plot.bio3d(pc$au[, 1], sse=pdbs2sse(pdbs), ylab="Loadings")

#Saving a  trajectory showing the collective motion defined by PC1

mktrj(pc, pc=1, file="~/project/data/processed/pc_1.pdb")
