## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 4,
  fig.height = 4
)

## ----two_by_two_system--------------------------------------------------------
library(grobblR)
 
grob_layout(
  grob_row(grob_col(1), grob_col(2)),
  grob_row(grob_col(3), grob_col(4)),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----two_by_three_system------------------------------------------------------
grob_layout(
  grob_row(grob_col(1), grob_col(2)),
  grob_row(grob_col(3)),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----two_by_two_system_w_borders----------------------------------------------
grob_layout(
  grob_row(
    border = TRUE,
    grob_col(border = TRUE, 1),
    grob_col(border = TRUE, 2)
    ),
  grob_row(
    border = TRUE,
    grob_col(border = TRUE, 3),
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

## ----two_by_one_system_all_p--------------------------------------------------
grob_layout(
  grob_row(p = 1, border = TRUE, grob_col('1')),
  grob_row(p = 2, border = TRUE, grob_col('2')),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----three_by_one_specific_heights--------------------------------------------
grob_layout(
  grob_row(height = 25, border = TRUE, grob_col('1')),
  grob_row(height = 50, border = TRUE, grob_col('2')),
  grob_row(height = 25, border = TRUE, grob_col('3')),
  height = 100,
  width = 100,
  padding = 0
  ) %>%
  view_grob()

## ----three_by_one_system_combo------------------------------------------------
grob_layout(
  grob_row(p = 3, border = TRUE, grob_col('1')),
  grob_row(height = 50, border = TRUE, grob_col('2')),
  grob_row(p = 1, border = TRUE, grob_col('3')),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----first_matrix-------------------------------------------------------------
mat = matrix(1:4, nrow = 2, byrow = TRUE)

grob_layout(
  grob_row(
    grob_col(
      mat,
      aes_list = ga_list(background_color = "gray90")
      )
    ),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----alter_at-----------------------------------------------------------------
mat %>%
  grob_matrix() %>%
  alter_at(
    ~ "red",
    columns = 1,
    aesthetic = "text_color"
    ) %>% 
  alter_at(
    ~ "blue",
    columns = 2,
    rows = 2,
    aesthetic = "background_color"
    ) %>%
  alter_at(
    ~ "white",
    columns = 2,
    rows = 2,
    aesthetic = "text_color"
    ) %>%
  view_grob()

## ----ggplot_grobs-------------------------------------------------------------
data(iris)
library(ggplot2)

gg1 = ggplot(
  data = iris, 
  mapping = aes(
    x = Sepal.Length,
    y = Sepal.Width,
    color = Species
    )
  ) +
  geom_point() +
  guides(color = FALSE)

gg2 = ggplot(
  data = iris,
  mapping = aes(
    x = Sepal.Length,
    y = Petal.Length,
    color = Species
    )
  ) +
  geom_point() +
  guides(color = FALSE)

grob_layout(
  grob_row(grob_col(gg1), grob_col(gg2)),
  grob_row(grob_col(gg1))
  ) %>%
  view_grob(height = 100, width = 100)

## ----png_grobs----------------------------------------------------------------
grob_layout(
  grob_row(
    border = TRUE,
    grob_col(
      border = TRUE,
      'kings_logo.png'
      ),
    grob_col(
      border = TRUE,
      aes_list = ga_list(
        maintain_aspect_ratio = FALSE
        ),
      'https://raw.githubusercontent.com/calvinmfloyd/grobblR/master/vignettes/kings_logo.png'
      )
    ),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----grob_image, eval=FALSE---------------------------------------------------
# grob_layout(
#   grob_row(
#     border = TRUE,
#     grob_col(
#       border = TRUE,
#       'kings_logo.png'
#       ),
#     grob_col(
#       border = TRUE,
#       'https://raw.githubusercontent.com/calvinmfloyd/grobblR/master/vignettes/kings_logo.png' %>%
#         grob_image() %>%
#         add_structure("maintain_aspect_ratio", FALSE)
#       )
#     ),
#   height = 100,
#   width = 100
#   ) %>%
#   view_grob()

## ----simple_text_grob---------------------------------------------------------
text = "The quick brown fox jumps over the lazy dog."

grob_layout(
  grob_row(
    border = TRUE,
    grob_col(
      border = TRUE,
      text
      )
    ),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----grob_text----------------------------------------------------------------
grob_layout(
  grob_row(
    border = TRUE,
    grob_col(
      border = TRUE,
      text %>%
        grob_text() %>%
        add_aesthetic("text_color", "blue") %>%
        add_aesthetic("font_face", 3)
      )
    ),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----empty_space_grob---------------------------------------------------------
df = data.frame(letter = letters[1:5], col1 = 1:5, col2 = 5:1)

grob_layout(
  grob_row(
    border = TRUE,
    grob_col(df),
    grob_col(
      grob_row(grob_col(df)),
      grob_row(grob_col(p = 1/3, NA))
      ),
    grob_col(
      grob_row(grob_col(p = 1/3, NA)),
      grob_row(grob_col(df))
      )
    ),
  height = 100,
  width = 100
  ) %>%
  view_grob()

## ----grob_to_pdf, eval=FALSE--------------------------------------------------
# first_page_grob_layout = grob_layout(
#   grob_row(
#     border = TRUE,
#     grob_col(df),
#     grob_col(
#       grob_row(grob_col(df)),
#       grob_row(grob_col(p = 1/3, NA))
#       ),
#     grob_col(
#       grob_row(grob_col(p = 1/3, NA)),
#       grob_row(grob_col(df))
#       )
#     ),
#   height = 100,
#   width = 100
#   )
# 
# second_page_grob_layout = grob_layout(
#   grob_row(
#     border = TRUE,
#     grob_col(
#       border = TRUE,
#       text
#       )
#     ),
#   height = 100,
#   width = 100
#   )
# 
# # grob_to_pdf(
# #   first_page_grob_layout,
# #   second_page_grob_layout,
# #   file_name = file.path(tempdir(), "test.pdf"),
# #   meta_data_title = 'Test PDF'
# #   )
# 
# # OR
# 
# grob_to_pdf(
#   list(first_page_grob_layout, second_page_grob_layout),
#   file_name = file.path(tempdir(), "test.pdf"),
#   meta_data_title = "Test PDF"
#   )

