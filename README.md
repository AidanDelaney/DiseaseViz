# DiseaseVis

The data are processed in GNU R and visualised as a graph. Thereafter, the graph is saved in a format that can be loaded into Gephi for exploratory analysis.  The source data are represented as a matrix where each row in the matrix represents whether or not each of the 20 biomarkers indicate the presence of a disease.  As an example, the fragment of our data presented in figure 1 states that neither Xanthine oxidase nor 3-ClTyr indicate the presence of Cancer whereas Protein-thiol disulfide OxRed is a biomarker that indicates Cancer.  In general, either a biomarker indicates the presence of a disease or it does not.  The binary nature of these observations lend themselves to computing the similarity of diseases using a Jaccard index [1].  The Jaccard distance between diseases is normalised between 0 and 1.  The more similarity between diseases the closer their Jaccard distance is to 0.

        Xanthine oxidase, 3-Cl-Tyr, Protein-thiol disulfide OxRed
Cancer,                0,        0,                             1


The computed matrix of Jaccard distances is then transformed into a matrix of edge weights and presented using a force-directed graph layout algorithm [2].  In our graph layout the diseases are visualised as graph vertices.  The edges of the graph are weighted with the inverse of their Jaccard distance.  Graph edges with a weight of 1 indicate a strong attraction between the vertices, whereas graph edges with a weight of 0 indicates no attraction between the vertices.  The graph layout is computed using the DrL algorithm and the results are saved to a Gephi file.

[1] Jaccard, Paul (1901), "Étude comparative de la distribution florale dans une portion des Alpes et des Jura", Bulletin de la Société Vaudoise des Sciences Naturelles, 37: 547–579.
[2] Martin, S., Brown, W.M., Klavans, R., Boyack, K.W., DrL: Distributed Recursive (Graph) Layout. SAND Reports, 2008. 2936: p. 1-10
