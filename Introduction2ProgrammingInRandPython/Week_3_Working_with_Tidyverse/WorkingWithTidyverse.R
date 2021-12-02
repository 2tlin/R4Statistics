install.packages("tidyverse")
library(tidyverse) # load to global namespace

moments::skewness(c(1,2,3,4,5,6,6))

# tidyverse
# contains useful readr, ggplot2 packages

# pipe operator '%>%' (function) chain functions together as a pipeline
head(cumsum(sin(seq(0, 6.2, 0.001))), 100)
# or using pipe operator '%>%'
seq(0, 6.2, 0.001) %>% sin(.) %>% cumsum() %>% head(.,100)
# or the same
seq(0, 6.2, 0.001) %>% sin() %>% cumsum() %>% head(100)
# from 4.1 version uses '|>' notation
seq(0, 6.2, 0.001) |> sin() |> cumsum() |> head(100)

# readr - read files with csv tcs format
em_data <- read_csv("resources/files/country_data2.csv")
em_data |> head(10)

# tibble - specialized dataframe which does NOT make any:
# - implicit data type conversiona
# - column renaming

if (is_tibble(em_data)) # TRUE
  print(em_data)

# get row
em_data[1, ]

# get column
em_data[2]

# get column as vector
c1 <- em_data[[2]] |> tail(10)
c2 <- em_data$mtCO2 |> head(10)
typeof(c2) #double

# get a single cell
em_data[2, 2] # 5402000000

# subset with logical vector
em_data[em_data$mtCO2 > 4 * mean(em_data$mtCO2), ]

# add a column by using 's'
em_data$pcCO2 <- em_data$mtCO2 / em_data$population
summary(em_data$pcCO2)

# Dplyr verbs
# Filter
em_data |> filter(em_data$mtCO2 > 4 * mean(em_data$mtCO2))
em_data |> filter(
  em_data$mtCO2 > 4 * mean(em_data$mtCO2) | em_data$population > 5000000000
)

# mutate - add new variables
em_data |>
  filter(em_data$mtCO2 > 4 * mean(em_data$mtCO2) | em_data$population > 5000000000) |>
  mutate(pcCO2 = mtCO2 / population) |>
  mutate(pcgdp = GDP / population)

# arrange - sorting
em_data |>
  filter(em_data$mtCO2 > 4 * mean(em_data$mtCO2) | em_data$population > 5000000000) |>
  mutate(pcCO2 = mtCO2 / population) |>
  mutate(pcgdp = GDP / population) |>
  arrange(decs(pcgdp))

# select  - column choice
em_data |>
  filter(em_data$mtCO2 > 4 * mean(em_data$mtCO2) | em_data$population > 5000000000) |>
  mutate(pcCO2 = mtCO2 / population) |>
  mutate(pcgdp = GDP / population) |>
  arrange(desc(pcCO2)) |>
  # select(country, pcCO2)
  select(country | starts_with("pc")) # + columns which starts with 'pc': pcCO2  pcgdp
#   country       pcCO2  pcgdp
#   <chr>         <dbl>  <dbl>
# 1 United States 16.7  57285.
# 2 Russia        12.3  26350.
# 3 Japan          9.92 38926.
# 4 Germany        9.22 49292.
# 5 Iran           7.85 17620.
# 6 China          6.65 15391.
# 7 India          1.49  6884.

# summarize - reduce aggregated values to scalar
em_data |>
  filter(em_data$mtCO2 > 4 * mean(em_data$mtCO2) | em_data$population > 5000000000) |>
  mutate(pcCO2 = mtCO2 / population) |>
  mutate(pcgdp = GDP / population) |>
  arrange(desc(pcCO2)) |>
  select(country | starts_with("pc")) |>
  summarize(
    n_obs = n(),
    mean_pcCO2 = mean(pcCO2),
    mean_pcgdp = mean(pcgdp),
    median_pcCO2 = median(pcCO2),
    median_pcgdp = median(pcgdp)
  )
# A tibble: 1 x 5
#   n_obs mean_pcCO2 mean_pcgdp median_pcCO2 median_pcgdp
#   <int>      <dbl>      <dbl>        <dbl>        <dbl>
# 1     7       9.16     30250.         9.22       26350.

# summary functions - n(), min(), max(), median(), sd(), IRQ()

# group_by  - группировка
un_council <- c("China", "France", "Russia", "United Kingdom", "United States")
opec <- c("Algeria", "Angola", "Equatorial Guinea", "Gabon", "Iran", "Iraq",
"Kuwait", "Libya", "Nigeria", "Congo, Republic Of The", "Saudi Arabia",
"United Arab Emirates", "Venezuela")

em_data |>
  filter(em_data$mtCO2 > 4 * mean(em_data$mtCO2) | em_data$population > 5000000000) |>
  mutate(pcCO2 = mtCO2 / population) |>
  mutate(pcgdp = GDP / population) |>
  arrange(desc(pcCO2)) |>
  select(country | starts_with("pc")) |>
  mutate(country_group = case_when(
    country %in% un_council ~ "UNSC", # ~ means return
    country %in% opec ~ "OPEC",
    TRUE ~ "Rest of the world",
  )) |>
  group_by(country_group) |>
  summarize(
    n_obs = n(),
    mean_pcCO2 = mean(pcCO2),
    mean_pcgdp = mean(pcgdp),
    median_pcCO2 = median(pcCO2),
    median_pcgdp = median(pcgdp)
  ) |>
  arrange(desc(median_pcgdp))

# A tibble: 3 x 6
#   country_group     n_obs mean_pcCO2 mean_pcgdp median_pcCO2 median_pcgdp
#   <chr>             <int>      <dbl>      <dbl>        <dbl>        <dbl>
# 1 Rest of the world     3       6.88     31701.         9.22       38926.
# 2 UNSC                  3      11.9      33008.        12.3        26350.
# 3 OPEC                  1       7.85     17620.         7.85       17620.

# joins
c_index <- read_csv("resources/files/cntry_index.csv")
c_index

inner_join(em_data, c_index, by = c("country" = "country"))
left_join(em_data, c_index, by = c("country" = "country"))
right_join(em_data, c_index, by = c("country" = "country"))
full_join(em_data, c_index, by = c("country" = "country"))
semi_join(em_data, c_index, by = c("country" = "country"))
anti_join(em_data, c_index, by = c("country" = "country"))