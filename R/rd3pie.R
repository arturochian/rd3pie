#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
rd3pie <- function(Data, Title = NULL,
    SubTitle = NULL, width = NULL, height = NULL ){

d3data <- lapply(1:nrow(Data), function(i) {
    res <- as.list(Data[i, ])
    return(res)})

lData <- list(data = list( content = d3data))
#   list(
#   header = list(
#     title = list(
#       text = Title),
#     subtitle = list(
#       text = SubTitle)
#     ),
#   data = list(
#     content = Data)
#   )

  # create widget
  htmlwidgets::createWidget(
    name = 'rd3pie',
    x = lData,
    width = width,
    height = height,
    package = 'rd3pie'
  )
}


#' Widget output function for use in Shiny
#'
#' @export
rd3pieOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'rd3pie', width, height, package = 'rd3pie')
}

# TODO
#' Widget render function for use in Shiny
#'
#' @export
renderRd3pie <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, rd3pieOutput, env, quoted = TRUE)
# TODO
}
