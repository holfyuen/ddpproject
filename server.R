library(shiny)
library(quantmod)

# Download data for a stock if needed, and return the data
# From reference
Sys.setlocale("LC_TIME", "English")
require_symbol <- function(symbol, envir = parent.frame()) {
  if (is.null(envir[[symbol]])) {
    envir[[symbol]] <- getSymbols(symbol, src="oanda", auto.assign = FALSE)
  }
  
  envir[[symbol]]
}

shinyServer(function(input, output) {
  # Create an environment for storing data
  symbol_env <- new.env()
  
  # Make a chart for a symbol, with the settings from the inputs
  make_chart <- function(symbol) {
    x<-paste(symbol,"/CNY",sep="")
    symbol_data <- require_symbol(x, symbol_env)
    
    if (input$period==1) {
    chartSeries(symbol_data,
                name      = symbol,
                subset    = paste(input$date, collapse = "::"),
                theme     = chartTheme("white",up.col="blue"))
    }
    else {
      chartSeries(to.weekly(symbol_data),
                  name      = symbol,
                  subset    = paste(input$date, collapse = "::"),
                  theme     = "white")      
    }
  }
  
  output$chart <- renderPlot({ make_chart(input$code) })

}
)