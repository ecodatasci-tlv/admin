#' ---
#' title: Survey responses
#' author: " "
#' ---
#+ r setup, include = FALSE
library(googledrive)
library(tidyverse)
library(janitor)
library(here)

# source(here("scripts/00_import-data.R"))
resp <- read_csv(here("data/2018-10-18_survey-priv.csv"))

#+ r, echo = FALSE
resp_times <- resp %>% 
    mutate(id = row_number()) %>% 
    gather(times, days, starts_with("What times work")) %>% 
    clean_names() %>% 
    select(id, times, days) %>% 
    mutate(times = str_extract(times, "[0-9-:]+")) %>% 
    separate_rows(days, sep = ", ") %>% 
    filter(!is.na(days)) 

resp_times %>% 
    mutate(times = fct_rev(times),
           days = fct_inorder(days)) %>% 
    count(times, days, sort = TRUE) %>% 
    ggplot(aes(days, times)) + 
    geom_tile(aes(fill = n), colour = "white") +
    scale_fill_gradient(low = "white", high = "steelblue") 

resp_clean <- resp %>% 
    clean_names() %>% 
    select(-starts_with("what_times_work")) %>% 
    rename(remote = contains("remote"),
           interests = contains("interests"),
           fave_r = contains("favorite"),
           comments = contains("comments")) %>% 
    mutate(r_comfort_level = str_extract(r_comfort_level, "^[a-zA-Z]+"),
           r_comfort_level = fct_relevel(r_comfort_level, 
                                         "Beginner", "Intermediate", "Advanced"))

ggplot(resp_clean, aes(r_comfort_level)) +
    geom_bar()

ggplot(resp_clean, aes(remote)) +
    geom_bar()
