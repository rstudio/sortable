# sortable: Drag-and-Drop in 'shiny' Apps with 'SortableJS'

Enables drag-and-drop behaviour in Shiny apps, by exposing the
functionality of the 'SortableJS'
<https://sortablejs.github.io/Sortable/> JavaScript library as an
'htmlwidget'. You can use this in Shiny apps and widgets, 'learnr'
tutorials as well as R Markdown. In addition, provides a custom 'learnr'
question type - 'question_rank()' - that allows ranking questions with
drag-and-drop.

## A new html widget

- [`sortable_js()`](https://rstudio.github.io/sortable/reference/sortable_js.md)
  is a low-level function that adds the `SortableJS` to your widgets.

## Important functions

The important functions in this package are:

- [`rank_list()`](https://rstudio.github.io/sortable/reference/rank_list.md)
  creates a drag-and-drop, rank list

- [`bucket_list()`](https://rstudio.github.io/sortable/reference/bucket_list.md)
  lets you add multiple `rank_list` objects in columns

## Custom question types for `learnr`

You can also use new question types in your `learnr` tutorials:

- [`question_rank()`](https://rstudio.github.io/sortable/reference/question_rank.md)

## See also

Useful links:

- <https://rstudio.github.io/sortable/>

- Report bugs at <https://github.com/rstudio/sortable/issues>

## Author

**Maintainer**: Andrie de Vries <apdevries@gmail.com>

Authors:

- Barret Schloerke <barret@posit.co>

- Kenton Russell <kent.russell@timelyportfolio.com> (Original author)
  \[conceptor\]

Other contributors:

- Posit \[copyright holder, funder\]

- Lebedev Konstantin ('SortableJS',
  https://sortablejs.github.io/Sortable/) \[copyright holder\]
