##### Load the cleaned data
cleaned_data <- read.csv("h1b_finaldataset.csv")

##### Exploratory Data Analysis
library(ggplot2)
library(dplyr)
library(tidyr)

# status vs waiting times
ggplot(cleaned_data, aes(x = status, y = Sub_to_dec)) +
  geom_boxplot() +
  theme_bw() +
  scale_y_continuous("Scaled Waiting Times") +
  scale_x_discrete("Application Status") +
  ggtitle("Waiting Times vs Application Status") +
  theme(plot.title = element_text(hjust = 0.5))

# status vs wages
ggplot(cleaned_data, aes(x = status, y = wage)) +
  geom_boxplot() +
  theme_bw() +
  scale_y_continuous("Scaled Wages") +
  scale_x_discrete("Application Status") +
  ggtitle("Wages vs Application Status") +
  theme(plot.title = element_text(hjust = 0.5))

# status vs application submission month
ggplot(cleaned_data, aes(x = status, y = sub_mon)) +
  geom_boxplot() +
  theme_bw() +
  scale_y_continuous("Application Submission Month") +
  scale_x_discrete("Application Status") +
  ggtitle("Wages vs Application Status") +
  theme(plot.title = element_text(hjust = 0.5))

# status vs submission month
d_month_status <- as.data.frame(cleaned_data %>%
                                  group_by(sub_mon, status) %>%
                                  summarise(Count = n()))

d_month_status <- d_month_status %>% spread(key = status, value = Count)
d_month_status$DENIED[is.na(d_month_status$DENIED)] <- 0
d_month_status$prop_denied <- d_month_status$DENIED*100/(d_month_status$CERTIFIED + d_month_status$DENIED)

ggplot(d_month_status, aes(x = sub_mon, y = prop_denied)) +
  geom_bar(stat = "identity") +
  ggtitle("Submission Month vs Denial Rate") +
  scale_x_discrete("Application Submission Month") +
  scale_y_continuous("Percentage applications denied")+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

# decision month vs denial rate
d_month_status <- as.data.frame(cleaned_data %>%
                                  group_by(de_mon, status) %>%
                                  summarise(Count = n()))

d_month_status <- d_month_status %>% spread(key = status, value = Count)
d_month_status$DENIED[is.na(d_month_status$DENIED)] <- 0
d_month_status$prop_denied <- d_month_status$DENIED*100/(d_month_status$CERTIFIED + d_month_status$DENIED)

ggplot(d_month_status, aes(x = de_mon, y = prop_denied)) +
  geom_bar(stat = "identity") +
  ggtitle("Decision Month vs Denial Rate") +
  scale_x_discrete("Application Decision Month") +
  scale_y_continuous("Percentage applications denied")+
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))
