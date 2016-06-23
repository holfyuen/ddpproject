library(shiny)

shinyServer(function(input, output) {

  output$chart <- renderPlot({
    curr<-read.csv(input$code)
    curr$Date<-as.Date(curr$Date)
    plot(curr,type="l",col=input$color,lwd=input$thickness,ylab="Rate")
    })

  output$text<- renderText(
{"This app intends to show the chart of Chinese Renminbi exchange rate against US Dollar, Euro, British Pound and Bitcoin from 2015-1-1 to 2016-6-17.
User can choose line width and color in its chart.
Exchange rate data is retrieved from Quandl with the following codes:
US Dollar: FED/RXI_N_B_CH
Euro: ECB/EURCNY
British Pound: BOE/XUDLBK89
Bitcoin: BAVERAGE/CNY
  "})
}
)