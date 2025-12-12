# Only load shinytest2 if it's available
# Load application support files into testing environment
if (requireNamespace("shinytest2", quietly = TRUE)) {
  # Your existing shinytest2 setup code here
  shinytest2::load_app_env()
}
