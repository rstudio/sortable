## Parson's problem

parsons(
  text = c("Drag from here", "Construct your solution here"),
  labels = list(
    c(
      "iris",
      "mutate(...)",
      "summarize(...)",
      "print()"
    ),
    NULL
  ),
  selector = paste0("input", 1:2),
  output_id = paste0("output", 1:2),
  group_name = "parsons_test",
)
