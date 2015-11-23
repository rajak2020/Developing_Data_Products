library(shiny)
library(datasets)
data(CO2)

# input has caption, plant, origin, treatment and obs variables
shinyServer(function(input, output) {

  datasetInput <- reactive({
         CO2[CO2$Plant     == input$plant & 
             CO2$Type      == input$origin & 
             CO2$Treatment == input$treatment, ] #note origin is Type in data set
  })
  
  output$caption <- renderText({
    input$caption
  })
  
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
})
