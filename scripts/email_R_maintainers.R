## Maybe email a random sample?

library(tidyverse)
library(stringr)
library(tibble)

# Get the CRAN db
cran <- tools::CRAN_package_db()

# the returned data frame has two columns with the same name???
cran <- cran[,-65]

# make it a tibble
cran <- tibble::as_tibble(cran)

# Get emails
cran$email <- str_extract(cran$Maintainer, "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}\\b")

# Let's create a df at user/email level as the treatment will be at user level
cran_unique <- cran[!duplicated(cran$email), ]

# Let's randomly sample 100 people
set.seed(42)

# Create a new column with values 0 and 1 in proportion of .01 (n ~ 100)
cran_unique$selected_init_sample <- sample(c(0, 1), size = nrow(cran_unique), replace = TRUE, prob = c(0.99, 0.01))

init_list <- cran_unique$email[cran_unique$selected_init_sample == 1]
file_path <- "dat/06_30_2023_list.txt"
writeLines(init_list, file_path)

# gmail send limit is 500 emails/day so get another 400
cran_unique$selected_second_sample <- sample(c(0, 1), size = nrow(cran_unique), replace = TRUE, prob = c(0.965, 0.035))

sec_list <- cran_unique$email[cran_unique$selected_init_sample == 0 & cran_unique$selected_second_sample == 1]
file_path <- "dat/06_30_2023_list_b.txt"
writeLines(sec_list, file_path)

# compliance is low so need to reach out to more people
cran_unique$last_sample <- sample(c(0, 1), size = nrow(cran_unique), replace = TRUE, prob = c(0.5, 0.5))

# Take out marek
rest_list <- cran_unique$email[cran_unique$selected_init_sample == 0 & 
                                 cran_unique$selected_second_sample == 0 & 
                                 cran_unique$last_sample == 1]
file_path <- "dat/07_01_2023_list.txt"
writeLines(rest_list, file_path)


