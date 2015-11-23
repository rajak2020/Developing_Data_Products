library(shiny)

shinyUI(fluidPage(
  
  titlePanel("CO2 Uptake By Plant Type (CO2 dataset in R)"),
  
  sidebarLayout(
    sidebarPanel(
      textInput("caption", "Caption:", "Subset Data of CO2 Uptake"),
      
      selectInput("plant", "Choose a Plant Code:", 
                  choices = c("Qn1", "Qn2", "Qn3",
                              "Mn1", "Mn2", "Mn3",
                              "Mc1", "Mc2", "Mc3"), 
                   "Qn1"),  # Qn1 is the initial-populated value
      
      selectInput("origin", "Choose a Plant Origin:", 
                  choices = c("Quebec", "Mississippi"),
                  "Quebec"), #Quebec is the initial-populated value
 
       selectInput("treatment", "Choose a Experiment Treatment Type:", 
                  choices = c("chilled", "nonchilled"), 
                  "nonchilled"), #nonchilled is the initial-populated value

      numericInput("obs", "Number of observations to view:", 3) # 3  is the initial-populated value
    ),
    
    
    mainPanel(
      h3(textOutput("caption", container = span)),
      
      verbatimTextOutput("summary"), 
      
      tableOutput("view")
    )
  )
))
