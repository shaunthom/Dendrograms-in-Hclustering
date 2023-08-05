getwd()
setwd("C:/Users/User/Documents")
#reading the file, the csv file does not have a header row

gene_file = read.csv("Ch12Ex13.csv", header=FALSE)
dim(gene_file)
head(gene_file)

?cor
corr_genes <- cor(gene_file, method = "pearson")
class(corr_genes)
#analyzing the correlation matrix
names(corr_genes)
dim(corr_genes)
head(corr_genes)
?as.dist
?dist
#converting the correlation matrix to distance for h clustering
d_matrix <- as.dist(1 - corr_genes)
hc_gene_single <- hclust(d_matrix, method = "single")

library(cluster)
plot(hc_gene_single, xlab="Distance Matrix values", ylab='Gene Values', main='Dendrogram by Single Linkage')
hc_gene_comp <- hclust(d_matrix, method = "complete")

plot(hc_gene_comp, xlab="Distance Matrix values", ylab='Gene Values', main='Dendrogram by Complete Linkage')
names(hc_gene_comp)
hc_gene$height
hc_gene$order
hc_gene$labels
