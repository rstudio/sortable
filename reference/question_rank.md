# Ranking question for learnr tutorials.

Add interactive ranking tasks to your `learnr` tutorials. The student
can drag-and-drop the answer options into the desired order.

## Usage

``` r
question_rank(
  text,
  ...,
  correct = "Correct!",
  incorrect = "Incorrect",
  loading = c("**Loading:** ", text, "<br/><br/><br/>"),
  submit_button = "Submit Answer",
  try_again_button = "Try Again",
  allow_retry = FALSE,
  random_answer_order = TRUE,
  options = sortable_options()
)
```

## Arguments

- text:

  Question or option text

- ...:

  parameters passed onto
  [`learnr::question()`](https://pkgs.rstudio.com/learnr/reference/quiz.html).

- correct:

  For `question`, text to print for a correct answer (defaults to
  "Correct!"). For `answer`, a boolean indicating whether this answer is
  correct.

- incorrect:

  Text to print for an incorrect answer (defaults to "Incorrect") when
  `allow_retry` is `FALSE`.

- loading:

  Loading text to display as a placeholder while the question is loaded.
  If not provided, generic "Loading..." or placeholder elements will be
  displayed.

- submit_button:

  Label for the submit button. Defaults to `"Submit Answer"`

- try_again_button:

  Label for the try again button. Defaults to `"Submit Answer"`

- allow_retry:

  Allow retry for incorrect answers. Defaults to `FALSE`.

- random_answer_order:

  Display answers in a random order.

- options:

  Options to be supplied to
  [sortable_js](https://rstudio.github.io/sortable/reference/sortable_js.md)
  object. See
  [sortable_options](https://rstudio.github.io/sortable/reference/sortable_options.md)
  for more details

## Value

A custom `learnr` question, with `type = sortable_rank`. See
[`learnr::question()`](https://pkgs.rstudio.com/learnr/reference/quiz.html).

## Details

Each set of answer options must contain the same set of answer options.
When the question is completed, the first correct answer will be
displayed.

Note that, by default, the answer order is randomized.

## Examples

``` r
## Example of rank problem inside a learnr tutorial
if (interactive()) {
  learnr::run_tutorial("question_rank", package = "sortable")
}
```
