## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4,
  fig.height = 4
)

## ----load---------------------------------------------------------------------
library(grobblR)

## ----two_by_two_system_w_borders----------------------------------------------
grob_layout(
  grob_row(
    grob_col(1),
    grob_col(border = TRUE, 2)
    ),
  grob_row(
    border = TRUE,
    grob_col(3),
    grob_col(
      border = TRUE,
      grob_row(border = TRUE, grob_col(border = TRUE, 4)),
      grob_row(border = TRUE, grob_col(border = TRUE, 5))
      )
    ),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----customizable_borders-----------------------------------------------------
grob_layout(
  grob_row(
    grob_col(1),
    grob_col(
      border = TRUE,
      border_aes_list = ga_list(
        border_color = "red"
        ),
      2
      )
    ),
  grob_row(
    border = TRUE,
    border_aes_list = ga_list(
      border_sides = "top",
      border_width = 5
      ),
    grob_col(3),
    grob_col(
      border = TRUE,
      border_aes_list = ga_list(
        border_sides = "left, bottom",
        border_color = "blue",
        border_width = 4
        ),
      4
      )
    ),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----title--------------------------------------------------------------------
grob_layout(
  title = "grob-layout title",
  grob_row(
    grob_col(1),
    grob_col(title = "grob-column title", 2)
    ),
  grob_row(
    title = "grob-row title",
    grob_col(3),
    grob_col(4)
    )
  ) %>%
  view_grob(height = 100, width = 100)

## ----title_height_adjustment--------------------------------------------------
grob_layout(
  title = "grob-layout title",
  title_height = 20,
  grob_row(
    grob_col(1),
    grob_col(
      title = "grob-column title",
      title_p = 0.5,
      2
      )
    ),
  grob_row(
    title = "grob-row title",
    title_height = 10,
    grob_col(3),
    grob_col(4)
    )
  ) %>%
  view_grob(height = 100, width = 100)

## ----title_aesthetic_adjustment-----------------------------------------------
grob_layout(
  title = "grob-layout title",
  title_height = 20,
  title_aes_list = ga_list(
    text_color = "blue",
    border_sides = "bottom"
    ),
  grob_row(
    grob_col(1),
    grob_col(
      title = "grob-column title",
      title_p = 0.5,
      title_aes_list = ga_list(
        font_face = 3,
        text_color = "white",
        background_color = "gray40"
        ),
      2
      )
    )
  ) %>%
  view_grob(height = 100, width = 100)

## ----caption------------------------------------------------------------------
grob_layout(
  caption = "grob-layout caption",
  grob_row(
    grob_col(1),
    grob_col(caption = "grob-column caption", 2)
    ),
  grob_row(
    caption = "grob-row caption",
    grob_col(3),
    grob_col(4)
    )
  ) %>%
  view_grob(height = 100, width = 100)

## ----caption_height_adjustment------------------------------------------------
grob_layout(
  caption = "grob-layout caption",
  caption_height = 20,
  grob_row(
    grob_col(1),
    grob_col(
      caption = "grob-column caption",
      caption_p = 0.5,
      2
      )
    ),
  grob_row(
    caption = "grob-row caption",
    caption_height = 10,
    grob_col(3),
    grob_col(4)
    )
  ) %>%
  view_grob(height = 100, width = 100)

## ----caption_aesthetic_adjustment---------------------------------------------
grob_layout(
  caption = "grob-layout caption",
  caption_height = 20,
  caption_aes_list = ga_list(
    text_color = "blue",
    border_sides = "bottom"
    ),
  grob_row(
    grob_col(1),
    grob_col(
      caption = "grob-column caption",
      caption_p = 0.5,
      caption_aes_list = ga_list(
        font_face = 3,
        text_color = "white",
        background_color = "gray40"
        ),
      2
      )
    )
  ) %>%
  view_grob(height = 100, width = 100)

## ----page_numbers-------------------------------------------------------------
grob_layout(
  grob_row(
    grob_col(1),
    grob_col(2)
    ),
  grob_row(
    grob_col(3),
    grob_col(4)
    ),
  page_number = 1
  ) %>%
  view_grob(height = 100, width = 100)

