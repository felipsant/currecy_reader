library(ggvis)

fluidPage(fluidPage(
  sidebarPanel(
    numericInput("totalBefore", "Total on Start Date:", 1000, min = 1, max = 100),
    radioButtons("currencyTo", "To:", currencyCodes, selected='USD'),
    radioButtons("currencyFrom", "From:", currencyCodes, selected='BTC'),
    sliderInput("displayDays", "Last (n) Days:", min = 30, max = 180, value = 180)
  ),
  mainPanel(
     #h3(renderPrint({"Total on Finish Date:"}),
     multiprintFun <- renderText({"Total on Start Date:"}),
     span(multiprintFun()),
     verbatimTextOutput("totalChangedBefore"),
     
     multiprintFun <- renderText({"Total on Finish Date:"}),
     span(multiprintFun()),
     verbatimTextOutput("totalChangedAfter"),
     
     multiprintFun <- renderText({"Total Difference:"}),
     span(multiprintFun()),
     verbatimTextOutput("totalDifference"),
     
     ggvisOutput("ggvis")
     #numericInput("totalCurrencyBefore", "Total Currency on Start Date", min=1),
     
     
     #,verbatimTextOutput("value")
    )
  #,dataTableOutput('table')
))