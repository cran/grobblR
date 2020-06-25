## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4,
  fig.height = 4
)

## ----load---------------------------------------------------------------------
library(grobblR)

## ----grob_matrix--------------------------------------------------------------

df = data.frame(x = c(1, 2), y = c(3, 4), z = c(5, 6))

df %>%
  grob_matrix() %>%
  view_grob()


## ----add_aesthetic_cells------------------------------------------------------

df %>%
  grob_matrix() %>%
  add_aesthetic(
    aesthetic = "text_color",
    value = "red",
    group = "cells"
    ) %>%
  view_grob()


## ----add_aesthetic_cells_column_names-----------------------------------------

df %>%
  grob_matrix() %>%
  add_aesthetic(
    aesthetic = "text_color",
    value = "red",
    group = "cells"
    ) %>%
  add_aesthetic(
    aesthetic = "text_color",
    value = "blue",
    group = "column_names"
    ) %>%
  view_grob()


## ----add_structure------------------------------------------------------------

df %>%
  grob_matrix() %>%
  add_structure(
    structure = "column_widths_p",
    value = c(3, 1, 1)
    ) %>%
  view_grob()


## ----add_column_headings------------------------------------------------------

df %>%
  grob_matrix() %>%
  add_column_headings(
    headings = list("C1", "C2"),
    heading_cols = list(c(1, 2), c(3))
    ) %>%
  view_grob()


## ----add_2_column_headings----------------------------------------------------

df %>%
  grob_matrix() %>%
  add_column_headings(
    headings = list("C1", "C2"),
    heading_cols = list(c(1, 2), c(3))
    ) %>%
  add_column_headings(
    headings = list("C3", "C4", "C5"),
    heading_cols = list(1, 2, 3)
    ) %>%
  view_grob()


## ----add_column_headings_empty_space------------------------------------------

df %>%
  grob_matrix() %>%
  add_column_headings(
    headings = list("C1"),
    heading_cols = list(c(1, 2))
    ) %>%
  view_grob()


## ----add_column_headings_aesthetics-------------------------------------------

df %>%
  grob_matrix() %>%
  add_column_headings(
    headings = list("C1"),
    heading_cols = list(c(1, 2))
    ) %>%
  add_aesthetic(
    aesthetic = "background_color",
    value = "blue",
    group = "column_headings"
    ) %>%
  add_aesthetic(
    aesthetic = "text_color",
    value = "white",
    group = "column_headings"
    ) %>%
  view_grob()


## ----initial_alter_at---------------------------------------------------------

df %>%
  grob_matrix() %>%
  add_aesthetic(
    aesthetic = "text_color",
    value = "blue",
    group = "cells"
    ) %>%
  alter_at(
    ~ "red",
    columns = c("x", "y"),
    rows = 1
    ) %>%
  view_grob()


## ----alter_at_structure-------------------------------------------------------

df %>%
  grob_matrix() %>%
  add_structure("column_widths_p", 1) %>%
  alter_at(~ 3, columns = 1) %>%
  view_grob()


## ----alter_at_with_conditional_evaluation-------------------------------------

df %>%
  grob_matrix() %>%
  add_aesthetic(
    aesthetic = "text_color",
    value = "blue",
    group = "cells"
    ) %>%
  alter_at(
    ~ "red",
    x > 1
    ) %>%
  alter_at(
    ~ "steelblue",
    y < 4,
    aesthetic = "background_color"
    ) %>%
  view_grob()


## ----alter_at_with_flexible_function------------------------------------------

test_function = function(x) ifelse(x > 3, "purple", "blue")

grob_matrix_with_function = df %>%
  grob_matrix() %>%
  add_aesthetic(
    aesthetic = "text_color",
    value = "white",
    group = "cells"
    ) %>%
  alter_at(
    ~ test_function(.),
    aesthetic = "background_color"
    )

grob_matrix_with_function %>% view_grob()


## ----alter_at_with_new_data---------------------------------------------------

formatted_df = apply(df, 2, function(x) paste0("F", x))

grob_matrix_with_new_data = formatted_df %>%
  grob_matrix() %>%
  alter_at(
    ~ test_function(.),
    x > 1,
    data = df,
    aesthetic = "text_color",
    group = "cells"
    )

grob_matrix_with_new_data %>% view_grob()


## ----grob_layout--------------------------------------------------------------

gl = grob_layout(
  grob_row(grob_col(grob_matrix_with_function)),
  grob_row(grob_col(grob_matrix_with_new_data))
  )

gl %>% view_grob(height = 100, width = 100)


