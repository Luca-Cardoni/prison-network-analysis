# prison-network-analysis

Social Network Analysis of prisoners relations in a 1950s prison dataset, using Gephi and R.


<<<<<<< Updated upstream
# Social Network Analysis of a 1950s Prison Population

## 1. Project Overview

This project applies Social Network Analysis (SNA) to the classic "Prison" dataset by MacRae (1960) to uncover the social structure within a male prison in the 1950s. The goal is to move beyond simple metrics and identify key influencers, communities, and the overall topology of the inmate network.

**Tools Used:**
* **R & igraph:** For statistical analysis, metric calculation, and community detection.
* **Gephi:** For initial exploratory visualization.

---

## 2. Key Questions and Methodology

The analysis was structured to answer several key questions:
1.  What is the overall structure of the network? Is it dense, connected, and clustered?
2.  Who are the most influential or central inmates?
3.  Are there distinct social groups or "factions" within the prison?

The methodology followed standard SNA practices: data import, global metric calculation, centrality analysis, and community detection using the Louvain algorithm.

---

## 3. Key Findings & Insights

### Global Network Metrics

The network is a single connected component, meaning no individual is completely isolated. Key metrics reveal a classic "small-world" structure:

* **Number of Inmates (Nodes):** 67
* **Number of Friendships (Edges):** 142
* **Network Density:** 0.064 (A sparse network where relationships are selective)
* **Clustering Coefficient:** 0.330 (Much higher than a random network, indicating a strong tendency to form tight-knit groups)

### Centrality & Influence

The analysis revealed a decentralized structure (Degree Centralization: 0.1024), meaning there isn't a single dominant "leader." Instead, different inmates are influential in different ways:

* **Top 3 "Brokers" (High Betweenness):** Inmates **7, 15, and 55** are critical connectors, bridging different social groups. Their removal would likely fragment the network.
* **Strong Correlation (Degree vs. Triangles):** A strong positive correlation of **0.74** shows that inmates with more friends are highly likely to be part of many closed, triangular relationships. This reinforces the idea that influence is built within dense, cohesive groups.

![Degree vs Triangles Correlation](images/degree-vs-triangles.png)

### Community Structure

The Louvain algorithm successfully identified **7 distinct communities** with a high modularity score of **0.556**, confirming a significant and non-random social structure.

![Network Communities](images/network-communities.png)

---

## 4. Conclusion

This analysis reveals a complex social landscape within the prison. The network is not random; it's a resilient "small-world" structure built on selective friendships and dense, local communities. Influence is not concentrated in one leader but distributed among popular individuals within clusters and key brokers who connect them.

---

## 5. How to Reproduce

To reproduce this analysis:
1.  Clone the repository.
2.  Open the R script in the `code/` folder.
3.  Ensure all required libraries (`igraph`, `Matrix`) are installed.
4.  Run the script. All data is located in the `data/` folder.
=======

\# Social Network Analysis of a 1950s Prison Population



\## 1. Project Overview



This project applies Social Network Analysis (SNA) to the classic "Prison" dataset by MacRae (1960) to uncover the social structure within a male prison in the 1950s. The goal is to move beyond simple metrics and identify key influencers, communities, and the overall topology of the inmate network.



\*\*Tools Used:\*\*

\* \*\*R \& igraph:\*\* For statistical analysis, metric calculation, and community detection.

\* \*\*Gephi:\*\* For initial exploratory visualization.



---



\## 2. Key Questions and Methodology



The analysis was structured to answer several key questions:

1\.  What is the overall structure of the network? Is it dense, connected, and clustered?

2\.  Who are the most influential or central inmates?

3\.  Are there distinct social groups or "factions" within the prison?



The methodology followed standard SNA practices: data import, global metric calculation, centrality analysis, and community detection using the Louvain algorithm.



---



\## 3. Key Findings \& Insights



\### Global Network Metrics



The network is a single connected component, meaning no individual is completely isolated. Key metrics reveal a classic "small-world" structure:



\* \*\*Number of Inmates (Nodes):\*\* 67

\* \*\*Number of Friendships (Edges):\*\* 142

\* \*\*Network Density:\*\* 0.064 (A sparse network where relationships are selective)

\* \*\*Clustering Coefficient:\*\* 0.330 (Much higher than a random network, indicating a strong tendency to form tight-knit groups)



\### Centrality \& Influence



The analysis revealed a decentralized structure (Degree Centralization: 0.1024), meaning there isn't a single dominant "leader." Instead, different inmates are influential in different ways:



\* \*\*Top 3 "Brokers" (High Betweenness):\*\* Inmates \*\*7, 15, and 55\*\* are critical connectors, bridging different social groups. Their removal would likely fragment the network.

\* \*\*Strong Correlation (Degree vs. Triangles):\*\* A strong positive correlation of \*\*0.74\*\* shows that inmates with more friends are highly likely to be part of many closed, triangular relationships. This reinforces the idea that influence is built within dense, cohesive groups.



!\[Degree vs Triangles Correlation](images/degree-vs-triangles.png)



\### Community Structure



The Louvain algorithm successfully identified \*\*7 distinct communities\*\* with a high modularity score of \*\*0.556\*\*, confirming a significant and non-random social structure.



!\[Network Communities](images/network-communities.png)



---



\## 4. Conclusion



This analysis reveals a complex social landscape within the prison. The network is not random; it's a resilient "small-world" structure built on selective friendships and dense, local communities. Influence is not concentrated in one leader but distributed among popular individuals within clusters and key brokers who connect them.



---



\## 5. How to Reproduce



To reproduce this analysis:

1\.  Clone the repository.

2\.  Open the R script in the `code/` folder.

3\.  Ensure all required libraries (`igraph`, `Matrix`) are installed.

4\.  Run the script. All data is located in the `data/` folder.

>>>>>>> Stashed changes
