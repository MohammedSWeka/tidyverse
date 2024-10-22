#### ggplot2 ####

diamonds <- as_tibble(diamonds)
diamonds
#### aesthetics ####
# generate scatterplot with geom_point()
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price))

# adjusting color within aes
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price, color = clarity))

# manually control color point outside aes
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price), color = "red") 

# adjust point size within aes
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price, size = clarity))

# global control of point size
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price), size = 4.5)

# map clarity to point shape within aes 
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price, shape = clarity))

# global control of point shape outside aes
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price), shape = 18)


#### facets ####

ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price)) + 
          # facet by clarity
          facet_wrap(~clarity, nrow = 2)

#### Geoms ####

# change geom_ to generate histogram
ggplot(data = diamonds) + 
          geom_histogram(mapping =  aes(carat))
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

# geom_bar for bar plots
ggplot(data = diamonds) + 
          geom_bar(mapping = aes(cut))

# geom_boxplot for boxplots
ggplot(data = diamonds) + 
          geom_boxplot(mapping = aes(x = color, y = price))

# fill globally changes bar color outside aes
ggplot(data = diamonds) + 
          geom_boxplot(mapping = aes(x = color, y = price), 
                       fill = "red")

#### tests plots ####
ggplot(data = diamonds, aes(x = carat, y = price, color = "blue")) + geom_point()

ggplot(data = diamonds, aes(x = carat, y = price), color = "blue") + geom_point()
ggplot(data = diamonds, aes(x = carat, y = price)) + geom_point(color = "blue")
ggplot(data = diamonds) + 
          geom_point(mapping = aes(x = carat, y = price, alpha = clarity))
#### ggplot customization ####
#### Colors ####

ggplot(diamonds) + 
          geom_point(mapping = aes(x = carat, y = price, color = clarity))


# generate bar plot
ggplot(diamonds) + 
          geom_bar(aes(x = clarity))

# color changes outline of bar
ggplot(diamonds) + 
          geom_bar(aes(x = clarity, color = clarity))

# use fill to color bars
ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = clarity))

# fill by separate variable (cut) = stacked bar chart
ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut))

ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut)) +
          # manually control colors used
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4"))

ggplot(diamonds) + 
          # fill scales to 100%
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4"))

ggplot(diamonds) + 
          # dodge rather than stack produces grouped bar plot
          geom_bar(aes(x = clarity, fill = cut), position = "dodge") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4"))


#### Labels ####
#### Titles ####

ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          # add titles
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut")

#### Axis labels ####


ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          # add y axis label explicitly
          ylab("proportion")

#### Themes ####

ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          # change plot theme
          theme_classic()















































