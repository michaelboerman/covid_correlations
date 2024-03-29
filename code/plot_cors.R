# function for plots

### PLOT CORRELATIONS
# params:
#   df:           the dataframe of inputs (can be any dimension)
#   x_series:     column name that should be on the x (default: date)
#   y_series:     column name that should be on the y (default: correlations)
#   title
#   subtitle
#   caption
#   average line: logical if you want to include the average line
#   filename:     name of file for the resulting plot (excluding path and extension)

### TEST VALUES
# x_series <-
# y_series <-
# title    <-
# subtitle <-
# caption  <-
# filename <-


# function name: plot_correlations
plot_correlations <- function(df, x_series, y_series, ylim, title, subtitle, caption, filename, avg_line = FALSE) {
  df %>%

    # remove last two obs, since some counties delay reporting.
    head(-2) %>%

    # continue with plotting
    ggplot(aes(x = !!sym(x_series))) +
    geom_line(aes(y = !!sym(y_series))) +
    theme_minimal() +
    geom_hline(yintercept = 0) +
    scale_y_continuous(
      expand = expansion(mult = 0),
      limits = c(-ylim, ylim)
    ) +
    scale_x_date(
      expand = expansion(mult = 0),
      date_breaks = "2 months",
      date_labels = "%B",
      minor_breaks = "1 month"
    ) +
    labs(
      title = title,
      subtitle = subtitle,
      caption = caption
    ) +
    ylab("Correlation") +
    theme(
      text = element_text(family = "serif"),
      axis.title.x = element_blank(),
      axis.line.y = element_line()
    ) 
  
    ggsave(
      filename = here(paste0("plots/", filename, ".jpg")),
      width = 12, height = 6
    )
}

# -----------------------------------------------------------------------------#
### PLOT NUMBER OBS USED ###
# function name: plot_obs_used
# Same params as above

plot_obs_used <- function(data, x_series, y_series, title, subtitle, caption, filename, avg_line = FALSE) {
  data %>%

    # remove last two obs, since not all countries have results.
    head(-2) %>%

    # continue with plotting
    ggplot(aes(x = !!sym(x_series))) +
    geom_line(aes(y = !!sym(y_series))) +
    theme_minimal() +
    scale_y_continuous(
      expand = expansion(mult = 0),
      limits = c(0, round(max((data[, y_series])), -1) + 10)
    ) +
    scale_x_date(
      expand = expansion(mult = 0),
      date_breaks = "2 months",
      date_labels = "%B",
      minor_breaks = "1 month"
    ) +
    labs(
      title = title,
      subtitle = subtitle,
      caption = caption
    ) +
    ylab("Number of Observations") +
    theme(
      text = element_text(family = "serif"),
      axis.title.x = element_blank(),
      axis.line = element_line()
    ) 
  
    ggsave(
      filename = paste0(here::here("plots"), "/", filename, ".jpg"),
      width = 12, height = 6
    ) 
}

# -----------------------------------------------------------------------------#
### PLOT JUST ONE DATE ###
plot_one_date <- function(df, date = "last", x_series, y_series, title, subtitle, caption, filename, avg_line = FALSE) {
  
  # input parameter default to "last", but can be "rand" or a date. Else, error.
  if (date == "last") {
    one_date <- max(df$date) - 1
  } else if (date == "rand") {
    one_date <- sample(df$date, size = 1)
  } else if (is.Date(date)) {
    one_date <- date
  } else {
    stop("The date should be one of: 'last', 'rand', or a date object.")
  }

  # from the full dataframe, grab just the one date of interest.
  covid_one_date <-
    df %>%
    filter(date == one_date)

  # grab correlation between the two. 
  corrs <- cor.test(
    pull(covid_one_date[, x_series]),
    pull(covid_one_date[, y_series])
  )

  # set the annotation position
  if (deparse(substitute(df)) == "county_level_data") { # us county
    annotation_x <- 0.075
    annotation_y <- 100000
  } else {
    annotation_x <- 3.0
    annotation_y <- 800000
  }

  covid_one_date %>%
    drop_na(x_series, y_series) %>%
    ggplot(aes(x = !!sym(x_series), y = !!sym(y_series))) +
    geom_point() +
    scale_y_log10(labels = scales::comma) +
    scale_x_log10(labels = scales::comma) +
    geom_smooth(method = "lm") +
    ggpubr::stat_regline_equation() +
    theme_minimal() +
    labs(
      title = title,
      subtitle = subtitle,
      caption = caption
    ) +
    ylab("Confirmed Cases") +
    xlab("Population Density") +
    annotate("text",
      x = annotation_x, y = annotation_y,
      size = 3,
      label = paste0("95% Interval on\n Correlation: \n", round(corrs$conf.int, 2)[1], " to ", round(corrs$conf.int, 2)[2])
    ) 
  
    ggsave(paste0(here::here("plots"), "/", filename, ".jpg"),
      width = 12, height = 6
    )
}
