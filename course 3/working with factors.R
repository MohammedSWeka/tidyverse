## working with factors 

## all 12 months
all_months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

## our data
some_months <- c("Mar", "Dec", "Jan",  "Apr", "Jul")
# alphabetical sort
sort(some_months)

# create factor
mon <- factor(some_months, levels = all_months)

# look at factor
mon


#### Manually Changing the Labels of Factor Levels: fct_releve() ####

mon_relevel <- fct_relevel(mon, "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", after = 0)

# releveled
mon_relevel
# releleveld and sorted
sort(mon_relevel)

#### Keeping the Order of the Factor Levels: fct_inorder() ####
# keep order of appearance
mon_inorder <- fct_inorder(some_months)

# output
mon_inorder

#### Re-ordering Factor Levels by Frequency: fct_infreq() ####
## take a look at frequency of each level 
## using tabyl() from `janitor` package
View (chickwts)
chickwts <- chickwts
tabyl(chickwts$feed)

## order levels by frequency 
fct_infreq(chickwts$feed) %>% head()

#### Re-ordering Factor Levels by Another Variable: fct_reorder() ####

## order levels by a second numeric variable 
chickwts %>%
          mutate(newfeed = fct_reorder(feed, weight)) %>% 
          ggplot(., aes(newfeed,weight)) +
          geom_point()

#### Combining Several Levels into One: fct_recode() ####

## 1. group horsebean and soybean into a single level
## 2. rename all the other levels.
chickwts %>%
          mutate(feed_recode = fct_recode(feed,
                                          "seed"    =   "linseed",
                                          "bean"    =   "horsebean",
                                          "bean"    =   "soybean",
                                          "meal"    =   "meatmeal",
                                          "seed"    =   "sunflower",
                                          "casein"  =   "casein"
          )) %>%
          tabyl(feed_recode)


#### Converting Numeric Levels to factors: ifelse() + factor() ####

## convert numeric variable to factor
chickwts %>%
          mutate(weight_recode = ifelse(weight <= 200, "low", "high"), 
                 weight_recode = factor(weight_recode)) %>%
          tabyl(weight_recode)

#### R4DS FACTORS ####
forcats::gss_cat
gss_cat |>
          count(race)

####  Modifying factor order ( for viz)


# categorial by continous 
relig_summary <- gss_cat |>
          group_by(relig) |>
          summarize(
                    tvhours = mean(tvhours, na.rm = TRUE),
                    n = n()
          )


ggplot(relig_summary, aes(x = tvhours, y = relig)) +
          geom_point()

ggplot(relig_summary, aes(x = tvhours, y = fct_reorder(relig, tvhours))) +
          geom_point()

relig_summary |>
          mutate(
                    relig = fct_reorder(relig, tvhours)
          ) |>
          ggplot(aes(x = tvhours, y = relig)) +
          geom_point()

## continous by continous 
rincome_summary <- gss_cat |>
          group_by(rincome) |>
          summarize(
                    age = mean(age, na.rm = TRUE),
                    n = n()
          )

ggplot(rincome_summary, aes(x = age, y = fct_reorder(rincome, age))) +
          geom_point() ## this is not appropriate

ggplot(rincome_summary, aes(x = age, y = fct_relevel(rincome, "Not applicable"))) +
          geom_point()

## reorder2
by_age <- gss_cat |>
          filter(!is.na(age)) |>
          count(age, marital) |>
          group_by(age) |>
          mutate(
                    prop = n / sum(n)
          )

ggplot(by_age, aes(x = age, y = prop, color = marital)) +
          geom_line(linewidth = 1) +
          scale_color_brewer(palette = "Set1")

ggplot(by_age, aes(x = age, y = prop, color = fct_reorder2(marital, age, prop))) +
          geom_line(linewidth = 1) +
          scale_color_brewer(palette = "Set1") +
          labs(color = "marital")

# fct_infreq
gss_cat |>
          mutate(marital = marital |> fct_infreq() |> fct_rev()) |>
          ggplot(aes(x = marital)) +
          geom_bar()


#########  Modifying factor levels

gss_cat |> count(partyid)


gss_cat |>
          mutate(
                    partyid = fct_recode(partyid,
                                         "Republican, strong"    = "Strong republican",
                                         "Republican, weak"      = "Not str republican",
                                         "Independent, near rep" = "Ind,near rep",
                                         "Independent, near dem" = "Ind,near dem",
                                         "Democrat, weak"        = "Not str democrat",
                                         "Democrat, strong"      = "Strong democrat"
                    )
          ) |>
          count(partyid)


gss_cat |>
          mutate(
                    partyid = fct_collapse(partyid,
                                           "other" = c("No answer", "Don't know", "Other party"),
                                           "rep" = c("Strong republican", "Not str republican"),
                                           "ind" = c("Ind,near rep", "Independent", "Ind,near dem"),
                                           "dem" = c("Not str democrat", "Strong democrat")
                    )
          ) |>
          count(partyid)

#### Wrangling categorical data in R ####

#Changing the labels of factor levels

GSS <- GSS %>% mutate(tidyLaborStatus = 
                                recode(LaborStatus,
                                       `Temp not working` = "Temporarily not working", 
                                       `Unempl, laid off` = "Unemployed, laid off", 
                                       `Working fulltime` = "Working full time", 
                                       `Working parttime ` = "Working part time")) 
summary(GSS$tidyLaborStatus)


## Reordering factor levels

library(forcats) 
summary(GSS$OpinionOfIncome)

GSS<-GSS %>% mutate(tidyOpinionOfIncome= fct_relevel(OpinionOfIncome, 
                                                     "Far above average", 
                                                     "Above average", 
                                                     "Average", 
                                                     "Below average",
                                                     "Far below average"))


### Combining several levels into one

# Combining discrete levels

mutate(tidyMaritalStatus = recode(MaritalStatus, 
                                  Divorced = "Not married", 
                                  `Never married` = "Not married", 
                                  Widowed = "Not married", 
                                  Separated = "Not married")) 
summary(GSS$tidyMaritalStatus)


## Combining numeric-type levels

library(readr) 
GSS <- GSS %>% mutate(tidyAge = parse_number(Age)) %>%

          mutate(tidyAge = if_else(tidyAge < 65, "18-65", "65 and up"), 
                 tidyAge = factor(tidyAge))


## Creating derived categorical variables

library(mosaic) 
library(mosaicData) 
library(dplyr) 
library(readr)

HELPsmall<-HELPsmall%>% mutate(drink_stat=case_when( 
          i1==0~"abstinent", 
          i1<=1&i2<=3&sex=='female'~"moderate", 
          i1<=1&i2<=3&sex=='male'&age>=65~"moderate", 
          i1<=2&i2<=4&sex=='male'~"moderate", 
          is.na(i1)~"missing", #can'tputNAinplaceof"missing" 
          TRUE~"highrisk" ))



HELPsmall%>% group_by(drink_stat)%>% dplyr::count()

#dates

mydate <- ymd("1993-12-09")

## subtract birthday from todays date
age <- today() - mydate
## Warning in with_tz(Sys.time(), tzone): Unrecognized time zone ''
age
## Time difference of 11726 days
## a duration object can get this information in years
as.duration(age)





