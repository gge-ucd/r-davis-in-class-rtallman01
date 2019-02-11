# Read portal_data_joined.csv into R using the tidyverse’s command called read_csv(), and assign it to an object named surveys.

# read script using tidyverse name it surveys
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")


# subset all rows to have values between 30-60


surveys %>%
  filter(weight >30) %>%
  filter (weight<60)
  
# only print the first 6 rows of the the tibble
surveys %>%
  filter(weight>30)%>%
  filter(weight<60) %>% head()

# Make a tibble that shows the max (hint hint) weight for each species+sex combination, and name it biggest_critters. Use the arrange function to look at the biggest and smallest critters in the tibble (use ?, tab-complete, or Google if you need help with arrange).

surveys %>%
  group_by(species,sex) %>%
  summarize(max_weight=max(weight, na.rm = TRUE )) %>%
  arrange(desc(max_weight))

  

biggest_critters <-surveys %>%
  group_by(species,sex) %>%
  summarize(max_weight=max(weight, na.rm = TRUE )) %>%
  arrange(desc(max_weight))

# Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange here.


surveys %>%
    group_by(species) %>%
  filter (is.na(weight)) %>% tally() %>% View
# Harissi had the highest number of NA's for species
  
surveys %>%
      group_by(taxa) %>%
      filter (is.na(weight))%>%tally() %>% View
# Rodents have the greatest number of NA by taxa
  
surveys %>%
    group_by(plot_id) %>%
    filter (is.na(weight))%>%tally() %>% View
# plot 13 has the most NA


# Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination. Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight. The resulting tibble should have 32,283 rows.

    
  surveys %>%
    group_by(species,sex) %>%
    filter(!is.na(weight)) %>%
    mutate(mean_weight=mean(weight)) %>%
    select(species,sex,weight,mean_weight) %>% View
  
  # Create new tibble
  
  surveys_avg_weight <- surveys %>%
    group_by(species,sex) %>%
    filter(!is.na(weight)) %>%
    mutate(mean_weight=mean(weight)) %>%
    select(species,sex,weight,mean_weight)

  
  ####### Challenge ####################
  
  # Challenge: Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble).
  
  Abv_Average<-surveys_avg_weight%>%
    mutate(above_average=weight>mean_weight)
  # Created a tibble to show which weights are above average for the species + sex combination
  
  
  
  ########### Challenge # 2 ################
  # Extra Challenge: Figure out what the scale function does, and add a column to surveys that has the scaled weight, by species. Then sort by this column and look at the relative biggest and smallest individuals. Do any of them stand out as particularly big or small?
  
  # Mean center your data
    
surveys %>%
    group_by(species) %>%
    mutate(scaled_weight=scale(weight)) %>% 
           arrange(desc(scaled_weight))

    # Re-wrote last line 3 times.... and it finally worked. The first two times I got an error message....
  
  
  
    
  