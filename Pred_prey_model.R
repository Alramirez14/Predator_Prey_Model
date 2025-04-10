#In lab excercise 4/10/25 for Analytical Workflows

#setting working directory
setwd(C:\Users\alect\OneDrive\Desktop\SP2025\Analytical_Methods\Predator_Prey_Model)

# Parameters
alpha <- 0.1   # prey growth rate
beta <- 0.02   # predation rate
gamma <- 0.1   # predator death rate
delta <- 0.01  # predator reproduction rate

# Initial conditions
x0 <- 40       # initial prey population
y0 <- 3       # initial predator population

# Time settings
dt <- 0.1        # time step
t_max <- 200     # max time
n_steps <- t_max / dt

# Vectors to store results
time <- numeric(n_steps)
prey <- numeric(n_steps)
predator <- numeric(n_steps)

# Initial values
x <- x0
y <- y0

# Euler loop
for (i in 1:n_steps) {
  time[i] <- (i - 1) * dt
  prey[i] <- x
  predator[i] <- y
  
  # Compute changes
  dx <- (alpha * x - beta * x * y) * dt
  dy <- (delta * x * y - gamma * y) * dt
  
  # Update populations
  x <- x + dx
  y <- y + dy
}

# Combine data into data frames
prey_df <- data.frame(Time = time, Prey = prey)
predator_df <- data.frame(Time = time, Predator = predator)

# Combine all data into a single data frame
pop_df <- data.frame(Time = time, Prey = prey, Predator = predator)

# Save to one CSV file
write.csv(pop_df, "predator_prey_population.csv", row.names = FALSE)





