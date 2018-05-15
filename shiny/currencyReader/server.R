library(ggvis)
library(dplyr)

shinyServer(function(input, output, session) {
  
  mutatedCurrencyData <- reactive({ 
    currencyData %>% filter(timestamp >= Sys.Date() - as.numeric(input$displayDays))
  })
  
  yVal <- reactive({
    mutatedCurrencyData()[,input$currencyTo] / mutatedCurrencyData()[,input$currencyFrom]
   })

  mutatedCurrencyData %>% 
        ggvis(~timestamp, y = yVal) %>% 
        scale_datetime("x", nice = "month") %>%
        layer_lines(stroke := "DarkGreen") %>%
        #layer_model_predictions(model = "lm", se = TRUE, stroke := "Red", formula = mutatedCurrencyData()[,input$currencyTo] / mutatedCurrencyData()[,input$currencyFrom] ~ timestamp, fillOpacity=0, strokeOpacity:=0.5) %>%
        add_axis("y", title = "Value To / Value From") %>%
        add_axis("x", title = "Date") %>% 
        bind_shiny("ggvis")

  #input$totalBefore
  get_start_val <- function(){
    return(mutatedCurrencyData()[,input$currencyTo][1])
  }
  get_end_val <- function(){
    return(tail(mutatedCurrencyData()[,input$currencyTo], n=1))
  }
  get_total_now <- function(val){
    input$totalBefore * val
  }
  
  output$totalChangedBefore <- renderText({ 
    start_val <- get_start_val()
    (input$totalBefore * start_val)
  })  
  output$totalChangedAfter <- renderText({ 
    end_val <- get_end_val()
    (input$totalBefore * end_val)
   })  
  output$totalDifference <- renderText({ 
    start_val <- get_start_val()
    end_val <- get_end_val()
    (input$totalBefore * start_val) - (input$totalBefore * end_val)
  })  
  
  output$value <- renderText({ 
    start_val <- get_start_val()
    end_val <- get_end_val()
    (input$totalBefore * end_val)
  })  
  
  
  #output$table <- renderDataTable(currencyData)
  #currencyData %>% ggvis(~timestamp, y = ~BRL) %>% layer_lines() %>% layer_model_predictions(model = "lm", se = TRUE, stroke := "Red", fillOpacity=0)
  
})
