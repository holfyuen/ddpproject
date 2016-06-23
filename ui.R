library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Renminbi Rate"),
  
  sidebarPanel(
    radioButtons("code", label=h3("Renminbi vs:"),
                choices=list("US Dollar" = "data/usdcny.csv", 
                     "Euro" = "data/eurcny.csv", 
                     "British Pound" = "data/gbpcny.csv",
                     "Bitcoin" = "data/btccny.csv")),
    radioButtons("color", label=h3("Color"),
                 choices=list("Black" = "black", 
                              "Blue" = "blue", 
                              "Green" = "green",
                              "Red" = "red")),
    sliderInput("thickness",label=h3("Thickness"),min=1,max=7,value=1,step=1)
    
  ),
  
  mainPanel(
    tabsetPanel(
    tabPanel("Plot",plotOutput("chart")),
    tabPanel("About",verbatimTextOutput("text"))
    )
    
  )
))