# ===================================================================
# SOCIAL NETWORK ANALYSIS OF A MALE PRISON POPULATION
# Project: Data Analysis Portfolio
# Dataset: MacRae J. (1960)
# Author: Luca Cardoni
# ===================================================================


# -- INITIAL SETUP --

# Load required libraries for the analysis
library(igraph)
library(Matrix)


# -- DATA IMPORT AND GRAPH CREATION --

# Load nodes and edges from CSV files
  # !! Ensure these files are located in the "data" subfolder
nodes <- read.csv("data/nodes.csv", header = TRUE, as.is = TRUE)
edges <- read.csv("data/edges.csv", header = TRUE, as.is = TRUE)

# Create an undirected graph object using the igraph package
  # d = defines the connections (links)
  # vertices = defines the individual prisoners
Graph <- graph_from_data_frame(d = edges, directed = FALSE, vertices = nodes)


# -- INITIAL NETWORK VISUALIZATION --

# Generate a basic plot of the network for a first visual inspection
plot(Graph,
     vertex.color = "skyblue2",
     vertex.size = 8,
     vertex.label.color = "black",
     vertex.label.cex = 0.5,   # Adjust label text size
     edge.color="green",
     edge.width = 0.5,
     main = "Prison Inmate Relations Network")


# -- GLOBAL NETWORK METRICS --

cat("--- Global Network Metrics ---\n")

# Check that the network is connected and there aren't isolated subgroups
connection <- is.connected(Graph)
cat("Is the graph connected?", connection, "\n")

# Calculate the clustering coefficient (transitivity)
clustering_coeff <- transitivity(Graph)
cat("Global Clustering Coefficient:", round(clustering_coeff, 3), "\n")

# Calculate network density measurement
net_density <- edge_density(Graph)
cat("Network Density:", round(net_density, 3), "\n")

# Cardinality of nodes and edges
num_nodes <- vcount(Graph)
num_edges <- ecount(Graph)
cat("Number of nodes (inmates):", num_nodes, "\n")
cat("Number of edges (relations):", num_edges, "\n\n")


# -- DEGREE DISTRIBUTION ANALYSIS --

# Calculate the degree for each node (number of connections)
degree(Graph)

# Create a histogram of nodes degree frequencies
hist(degree(Graph),
     main = "Node Degree Histogram",
     xlab = "Degree",
     ylab = "Frequency (Number of Nodes)",
     col = "skyblue2")

# Create a log-log plot to analyze the degree distribution
# This type of plot helps identify scale-free network properties
plot(degree.distribution(Graph), log = "xy",
     main = "Log-Log Degree Distribution",
     xlab = "Log(Degree)",
     ylab = "Log(Intensity)",
     col = "skyblue2",
     pch = 19)


# -- COHESIVE SUBGROUP ANALYSIS (CLIQUES) --

cat("--- Cohesive Subgroup Analysis (Cliques) ---\n")

# Find the size of the largest clique in the graph
max_clique_size <- clique_num(Graph)
cat("Size of the largest clique:", max_clique_size, "\n")

# Find the nodes forming the largest clique
max_clique_nodes <- largest_cliques(Graph)
cat("Nodes in the largest clique:", unlist(max_clique_nodes[1]), "\n")


# -- NODE METRICS CORRELATION --

cat("--- Node Metrics Correlation ---\n")

# Correlate node degree with its clustering coefficient
# This checks if highly-connected nodes are part of tightly-knit groups
cor_degree_clustering <- cor(nodes$degree, nodes$clustering, use = "complete.obs")
cat("Correlation between Degree and Clustering:", round(cor_degree_clustering, 3), "\n")

# Correlate node degree with its number of triangles
# This checks if highly-connected nodes participate in more 3-person relations circles
cor_degree_triangles <- cor(nodes$degree, nodes$triangles)
cat("Correlation between Degree and Triangles:", round(cor_degree_triangles, 3), "\n")

# Create a scatter plot to show the strong positive correlation between the nodes degree and the number of triangles
plot(nodes$degree, nodes$triangles,
     main = "Node Degree vs. Number of Triangles",
     xlab = "Node Degree",
     ylab = "Number of Triangles",
     pch = 19,
     col = "skyblue2")


# -- CENTRALITY ANALYSIS --

cat("--- Centrality Analysis ---\n")

# Calculate key centrality measures to identify important nodes in the network

# Degree Centralization: Influence based on the number of direct connections
degree_centralization <- centr_degree(Graph, mode = "all", normalized = TRUE)$centralization   # normalized = TRUE allows for comparison across networks of different sizes
cat("Network Degree Centralization:", round(degree_centralization, 3), "\n")

# Closeness Centralization: Measures how close a node is to all other nodes
closeness_centralization <- centr_clo(Graph, mode = "all", normalized = TRUE)$centralization
cat("Network Closeness Centralization:", round(closeness_centralization, 3), "\n")

# Betweenness Centrality: Measures how often a node acts as a bridge on the shortest path between other nodes
betweenness_scores <- estimate_betweenness(Graph, directed = FALSE, cutoff = -1)

# Extract the top 3 nodes by betweenness
top_brokers <- names(head(sort(betweenness_scores, decreasing = TRUE), 3))
cat("Top 3 'broker' node IDs:", top_brokers, "\n")


# -- COMMUNITY DETECTION --

cat("--- Community Detection ---\n")

# Apply the Louvain algorithm for community detection (based on modularity optimization)
# This is a highly effective and popular method for finding community structures
communities_found <- cluster_louvain(Graph)

# Print the modularity score (a value > 0.4 usually indicates a good partition)
modularity_score <- modularity(communities_found)
cat("Modularity score:", round(modularity_score, 3), "\n")

# Print the number of communities found
num_communities <- length(communities_found)
cat("Number of communities detected:", num_communities, "\n")

# Visualize the graph with nodes colored according to their community membership
plot(communities_found, Graph,
     layout = layout_with_fr(Graph),
     vertex.size = 8,
     vertex.label.cex = 0.5,
     main = "Network Communities (Louvain Algorithm)")


# -- END OF SCRIPT --