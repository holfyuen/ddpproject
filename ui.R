library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Renminbi Price"),
  
  sidebarPanel(
    radioButtons("code", label=h3("Renminbi vs:"),
                choices=list("US Dollar" = "USD", 
                     "Euro" = "EUR", 
                     "Japanese Yen" = "JPY",
                     "Bitcoin" = "BTC")),
    
    dateRangeInput(inputId = "date", label = h3("Date range"),
                   start = Sys.Date() - 180, end = Sys.Date()),
    radioButtons("period", label=h3("Chart"),
                 choices=list("Daily" = 1, 
                              "Weekly" = 2 
                              ))
  ),
  
  mainPanel(
    plotOutput("chart")
    
  )
))