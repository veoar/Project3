library(adegenet)
library(vcfR)
library(StAMPP)

# set working directory 

setwd("/Users/alexandrabaousi/Desktop/Bioinformatics 22-23/Project3/4dg_VCF")

# Define a function for diploids
vcfR2genlight.diplo <- function (x) {
  bi <- is.biallelic(x)
  if (sum(!bi) > 0) {
    msg <- paste("Found", sum(!bi), "loci with more than two alleles.")
    msg <- c(msg, "\n", paste("Objects of class genlight only support loci with two alleles."))
    msg <- c(msg, "\n", paste(sum(!bi), "loci will be omitted from the genlight object."))
    warning(msg)
    x <- x[bi, ]
  }
  CHROM <- x@fix[, "CHROM"]
  POS <- x@fix[, "POS"]
  ID <- x@fix[, "ID"]
  x <- extract.gt(x)
  x[x == "0|0"] <- 0
  x[x == "0|1"] <- 1
  x[x == "1|0"] <- 1
  x[x == "1|1"] <- 2
  x[x == "0/0"] <- 0
  x[x == "0/1"] <- 1
  x[x == "1/0"] <- 1
  x[x == "1/1"] <- 2
  x <- adegenet::as.genlight(t(x))
  adegenet::chromosome(x) <- CHROM
  adegenet::position(x) <- POS
  adegenet::locNames(x) <- ID
  x
}

# Import VCF file
vcf <- read.vcfR("reheadered_4dg_dips.clean_BI.ann.vcf")
dip.genlight <- vcfR2genlight.diplo(vcf)

# Add population names (assuming pop names are first 5 chars of ind name)
pop(dip.genlight) <- substr(indNames(dip.genlight), 1, 3)

# Calculate genetic distance between individuals/pops
dip.D.ind <- stamppNeisD(dip.genlight, pop = FALSE) # Nei's 1972 distance between indivs
dip.D.pop <- stamppNeisD(dip.genlight, pop = TRUE) # Nei's 1972 distance between pops

# Export the genetic distance matrix in Phylip format - for SplitsTree
stamppPhylip(dip.D.ind, file = "dip.indiv_Neis_distance.phy.dst")
stamppPhylip(dip.D.pop, file = "dip.pop_Neis_distance.phy.dst")
