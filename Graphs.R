source("../Midterm/data_cleaning.R")


#Plotting graph
one_wall_graph <- graph(sql_one_wall5,"2020-07-29","2020-10-18")
bounce_graph <- graph(sql_bounce_180,"2020-07-08","2020-10-18")

one_wall_graph
bounce_graph

final_graph <- ggarrange(one_wall_graph, bounce_graph, 
          labels = c("A", "B"),
          ncol = 1, nrow = 2)
final_graph
#Issue with compiling, may need to run final_graph by itsel to get the graphs sometimes.