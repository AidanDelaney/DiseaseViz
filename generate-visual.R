library(proxy)
library(igraph)
library(rgexf)
library(plyr)
#library(Matrix)

#biomarker_data = read.csv("test.csv", sep=",", row.names = 1);
biomarker_data = read.csv("jeroentransposed.txt", sep=",", row.names = 1);

# Compute Jaccard similarity
d <- as.matrix(dist(biomarker_data, method="Jaccard"))

# Get the inverse of the Jaccard similarity
#   - these are the edge weights
w <- apply(d, 1, function(x){1-x})

# Set the diagonal edge weights to be ignored
diag(w)=NA

# Build an adjacency graph
g <- graph.adjacency(w, weighted=T, mode = "undirected")
g <- simplify(g)

# The DrL layout algorthm uses a random number generator. Setting
# the seed to the same number produces the same layout each time.
set.seed(42)

# Comput the DrL graph layout
l = layout_with_drl(g)

# Compute clusters of similarity from the graph data
com <- cluster_spinglass(g, spins=30)

# If vertices are in the same cluster, give them the same colour
V(g)$color <- com$membership

# Plot the graph on-screen
plot(g, layout=l, frame=TRUE, vertex.label.cex=0.5)

# Serialise the graph to Gephi format
gexf_data <- rgexf::igraph.to.gexf(g)
print(gexf_data, file="jeroentransposed.gexf", replace=T)