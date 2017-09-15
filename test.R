####read in data ####

df <- read.csv("Metadata.csv")

#### which variables?
str(df)

#### Start plotting
library ("ggplot2")
#### make first plot
ggplot(data = df, aes(x = Timepoint, y = ph, fill = Reactor.cycle)) +
geom_point(shape = 21)
View(df)

### it is important to check the names of the variable, without quotation marks, it is not a character, you are defining the variables from you dataframe
### then you define the x and y in your graph. Never use a name of a function to name your variables

## More basic graph: ggplot(data = df, aes(x = Timepoint, y = ph, fill = Reactor.cycle)) + geom_point ()
## Change colours including fill term and how

df$Reactor.cycle <- factor(df$Reactor.cycle)
ggplot(data = df, aes(x = Timepoint, y = ph, fill = Reactor.cycle)) +
  geom_point(shape = 21)
##if we have data (nubmers) from our database, R recognize as continuous variable, discrete variable or factor
# we can change the variables using the funtion df=define
##Warning message: Removed 8 rows containing missing values (geom_point).keep this in mind

p1 <- ggplot(data = df, aes(x = Timepoint, y = ph, fill = Reactor.phase)) +
  geom_point(shape = 21, size=4, alpha=.5) + theme_bw() 
p2 <- p1 + geom_line()


###store ggplot object
 p3 <- p2 + facet_grid(~Reactor.cycle)
 p3

 ### faceting
 ## name p_X the graphs to modify them and not rewritte with runnignt he code.
 ## USING TWO FACTOR
 df$Reactor.phase
 levels(df$Reactor.phase)
 #this line gives the relevant information in the variable to check what we want to plot
 p4 <- p2 + facet_grid(Reactor.phase~Reactor.cycle)+
 p4
 #formula: dependent vs independent variables= this is a formula object in R
test_object <- Reactor.cycle~ Reactor.phase
test_object

#take into account for graphs: what is redundant in the graphs, we can have a look in the different variables and remove legends, colours that are not needed can be removed
#we can change colour depending the variable we want to coulour depending on
p4 + geom_line()
p4 + geom_line (aes(color=Reactor.phase))

#aes function to modify inside the graph we have colour, sizes, etc.

### Challenge: 
 # Right side: conductivity
  #Middle: Diversity D0
  #Left: Cell density

