library(jsonlite)
library(tidyverse)
library(here)

reward_raw <- stream_in(file(here::here("..","original_data","public_train_reward_schedules.jsonl")))
behaviour_raw <- stream_in(file(here::here("..","original_data","public_train.jsonl")))

reward_df <-
  reward_raw %>%
  mutate(
    reward_schedule = map(reward_schedule, function(df) {
      
      rewards <- do.call(rbind, df$available_rewards)
      
      tibble(
        trial_index = df$trial_index,
        arm0 = rewards[,1],
        arm1 = rewards[,2],
        arm2 = rewards[,3],
        arm3 = rewards[,4]
      )
    })
  ) %>%
  unnest(reward_schedule) %>% 
  mutate(block_id = metadata$block_id) %>% 
  select(-metadata)

behaviour_df <-
  behaviour_raw %>%
  unnest(context) %>% 
  unnest(metadata) %>% 
  unnest(trials) %>% 
  unnest(info)

df <- behaviour_df %>%
  left_join(
    reward_df,
    by = c(
      "trajectory_id",
      "subject_id",
      "task_id",
      "trial_index",
      "block_id"
    )
  )

df_same <- df %>% select((df %>% 
    summarise(across(everything(), ~ n_distinct(.))) %>% 
    pivot_longer(everything(),names_to = "column",values_to = "n_unique") %>% 
    filter(n_unique == 1))$column) %>% 
  head(1)

df <- df %>% select(-(df %>% 
  summarise(across(everything(), ~ n_distinct(.))) %>% 
  pivot_longer(everything(),names_to = "column",values_to = "n_unique") %>% 
  filter(n_unique == 1))$column)

readr::write_csv(df, here::here("processed_data.csv"))