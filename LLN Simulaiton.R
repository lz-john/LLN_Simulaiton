library(ggplot2)
# Set seed for reproducibility
set.seed(12345)
# Number of coin flips
n <- 5000
# Simulate coin flips (0 for tails, 1 for heads)
coin_flips <- rbinom(n, size = 1, prob = 0.5)
# Compute cumulative number of heads
total_heads <- cumsum(coin_flips)
# Create a data frame for plotting
lln_df <- data.frame(
  flip_number = 1:n,       # Using 1:n for clarity
  proportion_heads = total_heads/(1:n)
)
# Create the plot
ggplot(lln_df, aes(x = flip_number, y = proportion_heads)) +
  geom_line(color = "blue") +
  labs(title = "Law of Large Numbers: Running Average of Heads",
       x = "Number of Coin Flips",
       y = "Proportion of Heads") +
  # Draw reference lines at 0.49 and 0.51
  geom_abline(slope = 0, intercept = 0.51, linetype = "dashed", color = "red") +
  geom_abline(slope = 0, intercept = 0.49, linetype = "dashed", color = "red") +
  scale_y_continuous(limits = c(0, 1)) +
  theme_minimal()
