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

#### custom theme ####
ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          theme_classic() +
          # control theme
          theme(title = element_text(size = 16), 
                axis.text = element_text(size =14),
                axis.title = element_text(size = 16),
                legend.text = element_text(size = 14))

ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          theme_classic() +
          theme(title = element_text(size = 16), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                # additional control
                plot.subtitle = element_text(color = "gray30"))

#### Legends ####
ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          theme_classic() +
          theme(title = element_text(size = 16), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                plot.subtitle = element_text(color = "gray30")) +
          # control legend
          guides(fill = guide_legend("cut quality")) 


ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          theme_classic() +
          theme(title = element_text(size = 16), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                plot.subtitle = element_text(color = "gray30")) +
          # control legend
          guides(fill = guide_legend("Cut Quality", 
                                     ncol = 2))
ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          theme_classic() +
          theme(title = element_text(size = 16), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                plot.subtitle = element_text(color = "gray30")) +
          # control legend
          guides(fill = guide_legend("Cut Quality", 
                                     title.theme = element_text(face = "bold")))

ggplot(diamonds) + 
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          # changing the legend title:
          guides(fill = guide_legend("Cut Quality")) +
          theme_classic() +
          theme(title = element_text(size = 16), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                plot.subtitle = element_text(color = "gray30"),
                # changing the legend style:
                legend.title = element_text(face = "bold"),
                legend.background = element_rect(color = "black"))

#### Scales ####
ggplot(diamonds) + 
          geom_bar(aes(x = clarity)) +
          # control scale for continuous variable
          scale_y_continuous(breaks = seq(0, 17000, by = 1000))
ggplot(diamonds) + 
          geom_bar(aes(x = clarity)) +
          # control scale for continuous variable
          scale_y_continuous(trans = "log10") +
          labs(y = "Count (log10 scale)",
               x = "Clarity")


ggplot(diamonds) + 
          geom_boxplot(aes(y = price, x = clarity))

ggplot(diamonds) + 
          geom_boxplot(aes(y = price, x = clarity)) + 
          scale_y_continuous(trans = "log10") + 
          labs(y = "Price (log10 scale)",
               x = "Diamond Clarity")


ggplot(diamonds) + 
          geom_boxplot(aes(y = price, x = clarity)) + 
          scale_y_continuous(trans = "log10", 
                             labels = scales::label_dollar()) +
          labs(y = "Price (log10 scale)",
               x = "Diamond Clarity")


ggplot(diamonds) + 
          geom_bar(aes(x = clarity)) +
          # control scale for discrete variable
          scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
          scale_y_continuous(breaks = seq(0, 17000, by = 1000)) 


#### Coordinate Adjustment ####

ggplot(diamonds) + 
          geom_bar(aes(x = clarity)) +
          scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
          scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
          # flip coordinates
          coord_flip() +
          labs(title = "Clearer diamonds tend to be of higher quality cut",
               subtitle = "The majority of IF diamonds are an \"Ideal\" cut") +
          ylab("proportion") +
          theme_classic() +
          theme(title = element_text(size = 18), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                plot.subtitle = element_text(color = "gray30")) +
          guides(fill = guide_legend("cut quality")) 


p <- ggplot(diamonds) + 
          geom_bar(mapping = aes(x = clarity)) +
          scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
          scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
          coord_flip() +
          labs(title = "Number of diamonds by diamond clarity",
               subtitle = "Subset of all diamonds, looking three levels of clarity") +
          theme_classic() +
          theme(title = element_text(size = 18), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                plot.subtitle = element_text(color = "gray30") ) 


#### Annotation ####

ggplot(diamonds) + 
          geom_bar(aes(x = clarity)) +
          scale_y_continuous(breaks = seq(0, 17000, by = 1000)) +
          scale_x_discrete(limit = c("SI2", "SI1", "I1")) +
          coord_flip() +
          labs(title = "Number of diamonds by diamond clarity",
               subtitle = "Subset of all diamonds, looking three levels of clarity") +
          theme_classic() +
          theme(title = element_text(size = 18), 
                axis.text = element_text(size = 14),
                axis.title = element_text(size = 16, face = "bold"),
                legend.text = element_text(size = 14),
                plot.subtitle = element_text(color = "gray30")) +
          # add annotation
          annotate("text", label = "SI1 diamonds are among \n the most frequent clarity diamond", 
                   y = 12800, x = 2.9, 
                   vjust = "top", hjust = "right", 
                   size = 6)

#### Vertical and Horizontal Lines ####
 
ggplot(diamonds) + 
          # fill scales to 100%
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          scale_y_continuous(labels = scales::percent) +
          labs(y = "Percent of diamonds") +
          geom_hline(yintercept = 0.5, color = "red", size = 1)


ggplot(diamonds) + 
          # fill scales to 100%
          geom_bar(aes(x = clarity, fill = cut), position = "fill") +
          scale_fill_manual(values = c("red", "orange", "darkgreen", "dodgerblue", "purple4")) +
          scale_y_continuous(labels = scales::percent) +
          labs(y = "Percent of diamonds") +
          geom_hline(yintercept = 0.5, color = "red", size = 1 ) +
          geom_vline(xintercept = 5.5, color = "black", size = .5)

#### ggrepel ####
mtcars <- mtcars %>%
          as_tibble(rownames = "model")


# label points without ggrepel
ggplot(mtcars, aes(wt, hp, label = model)) +
          geom_text() +
          geom_point(color = 'dodgerblue') +
          theme_classic()

# install and load package
# install.packages("ggrepel")
library(ggrepel)

# label points with ggrepel
ggplot(mtcars, aes(wt, hp, label = model)) +
          geom_text_repel() +
          geom_point(color = 'dodgerblue') +
          theme_classic()

# create a new column "merc" with true or false for Mercedes
# value is true for rows with "Merc" in model column
mtcars <- mtcars%>%
          mutate(merc = str_detect(string = model, pattern = "Merc"))

# Let's just label these items and manually color the points
ggplot(mtcars, aes(wt, hp, label = model)) +
          geom_point(aes(color = merc)) +
          scale_color_manual(values = c("grey50", "dodgerblue")) +
          geom_text_repel(data = filter(mtcars, merc == TRUE),
                          nudge_y = 1, 
                          hjust = 1,
                          direction = "y") +
          theme_classic() +
          theme(legend.position = "none")

#### directlabels #####
#install.packages("directlabels")
library(directlabels)

#first create a new column for mpg > 30 within mtcars and pipe this into ggplot
mtcars %>%
          mutate(mpg_highlight = case_when(mpg > 30 ~ "high", mpg < 30 ~ "low")) %>%
          ggplot(aes(qsec, mpg, label = model)) +
          geom_point(aes(color = mpg_highlight)) +
          scale_color_manual(values = c("dodgerblue", "black")) +
          scale_x_continuous(expand = c(0.05, 0.05)) +
          scale_y_continuous(limits = c(NA, 36)) +
          geom_dl(data = filter(mtcars, mpg > 30), aes(label = model), 
                  method = list(c("first.points"),
                                cex = 1)) +
          theme_minimal() +
          theme(legend.position = "none")

#### cowplot ####

# install and load package
# install.packages("cowplot")
library(cowplot)

mtcars <- mtcars %>%
          mutate(transmission = fct_recode(as.factor(am), "automatic" = "0", "manual" = "1"),
                 engine = fct_recode(as.factor(vs), "v-shaped" = "0", "straight" = "1"))

p1 <- ggplot(mtcars, aes(qsec, mpg, color = transmission)) + 
          geom_point() +
          theme_cowplot(12) + 
          theme(legend.position = c(0.7, 0.2))
p1

p2 <- ggplot(mtcars, aes(qsec, mpg, color = engine)) + 
          geom_point() +
          scale_color_manual(values = c("red", "blue")) +
          theme_cowplot(12) +
          theme(legend.position = c(0.7, 0.2))
p2

# plot side by side
plot_grid(p1, p2, ncol = 2)
# plot on top of one another
plot_grid(p1, p2, ncol = "1")




































