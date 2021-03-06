#Group 5- Project 1

#Preparing the graph. Data was cleaned to reduce to 45 nodes
test1<-read.table("/Users/aarvithadeshwar/Downloads/p1/out.subelj_jdk_jdk")
em<-as.matrix(test1)
View(em)
graph1 <- graph.data.frame(em, directed = TRUE)
upgrade_graph(graph1)
graph2<-upgrade_graph(graph1)
View(graph2)
degree(em)
g3<-graph_from_data_frame(em, directed = TRUE)
degree(em)
is.simple(g3)
g4<-simplify(graph1, remove.multiple = TRUE)
plot(g4)
page_rank(g4)
is.simple(g4)
g4<-simplify(graph1, remove.multiple = TRUE, remove.loops = TRUE)
plot(g4)
g4_dist<-degree_distribution(g4)
View(g4_dist) 
g5<-delete.vertices(g4, V(g4)[degree(g4)<=200])
View(degree(g5))
plot(g5)




#Functions from lecture slides
toMat<-as.matrix.default(g5)
adjMat<-as_adjacency_matrix(toMat)
adjMat


wcg5<-walktrap.community(g5)
plot(wcg5,g5,vertex.size=5, edge.arrow.size=0.25, layout=layout.fruchterman.reingold)


alphag5<-alpha_centrality(g5, alpha=2)
View(alphag5)

g5_adj <- as_adjacency_matrix(g5)
g5_adj <- as.matrix(g5_adj)
geodist(g5_adj)
gden(g5_adj)
connectedness(g5_adj)
is.connected(g5_adj)


edge.disjoint.path(g6, 7, 39)
edge.disjoint.path(g6, 5, 8)
edge.disjoint.path(g6, 22, 34)


page_rank(g6)


vertex_attr(g6)


centr_betw(g6, directed = TRUE)


#Functions from documentation
grid<-layout_on_grid(g5, width = 0, height = 0, dim=2)
plot(g5, layout= layout_on_grid(g5, dim=2), edge.arrow.size=0.15)


mstg5<-mst(g5, weights = NULL)
plot(mstg5, edge.arrow.size=0.25)


incident_edges(g5, 15,  mode = "in")
incident_edges(g5, 15,  mode = "out")
incident_edges(g5, 15,  mode = "total")


components(g5, mode= "strong")
component_distribution(g5, cumulative = FALSE, mul.size = FALSE, mode="strong")


hs <- hub_score(g5, weights=NA)$vector
as <- authority_score(g5, weights=NA)$vector
par(mfrow=c(1,2))
plot(g5, vertex.size=hs*50, main="Hubs", edge.arrow.size=0.15,layout= layout_on_grid(g5, dim=2))
plot(g5, vertex.size=as*30, main="Authorities", edge.arrow.size=0.25,layout= layout_on_grid(g5, dim=2)) 


cluster_walktrap(g6, steps = 3)
cluster_walktrap(g6, steps = 6)


biconnected.components(g6)


edge_density(g6)


farthest_vertices(g6)


dyad_census(g6)


radius(g5)
mean_distance(g5)
connected_g5<-connect(g5, 2)
plot(connected_g5)
plot(rewire(g5, each_edge(p = .1, loops = FALSE)))
V(g5)[40]
count_triangles(g5,V(g5)[40])
V(g5)[4]
count_triangles(g5,V(g5)[4])


#code for question 7
ego<- make_ego_graph(g5, order = 3, mode = "out")
diameter_sub_graphs<-lapply(third_order, diameter)
result<-as.matrix(diameter_sub_graphs)
result
g7<-delete_vertices(g5, V(g5)[4,17,18,31,32,33,34,35,36,41,42,43,44,45,1,2,6,7,8,9,11,13,14,15,19])


plot(g7)
ego_sizes<-ego(g7, order = 3, mode = "out")
ego_sizes
as_adjacency_matrix(g7)
