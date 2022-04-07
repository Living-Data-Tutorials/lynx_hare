library(tidyverse) 

data<-read_csv("data/lynx_hare_data.csv") #read in the dataset
# I have saved and labelled the dataset locally from this website https://jckantor.github.io/CBE30338/02.05-Hare-and-Lynx-Population-Dynamics.html

#have a look at the data
head(data)

# let's make the data "long" so we can get use it nicely in ggplot, using pivot_longer
data_long<-data %>% 
  pivot_longer(cols = c(lynx, hare), names_to = "animal", values_to = "abundance")

#have a look 
head(data_long)
#now the animal are in one column, and the abundance is in another.

#let's use these to see how abundance changes across time
data_long%>%
  ggplot(aes(x=year, y=abundance, col=animal)) + #set up the aesthetics of ggplot
  geom_path() + #make a line
  theme_bw()
   
#let's plot the lynx-abundance as a function of the hare abundance     
data%>%
  filter(year>1910,
         year<1935) %>%
  ggplot(aes(x=hare, y=lynx, col=year)) +
  geom_path() + 
  scale_colour_gradient(low = "blue", high = "red", na.value = NA) +
  theme_bw()


