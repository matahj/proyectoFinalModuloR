library(shiny)

ui <- pageWithSidebar(
  
  headerPanel("Proyecto final módulo de R"),
  
  sidebarPanel(p("Vamos a crear plots con el dataset de 'iris'"),
               selectInput("x", "Selecciona el eje de las X",
                           choices = names(iris) )
  ),
  
  mainPanel(
    tabsetPanel(
      
      tabPanel("Gráficas", 
               h3(textOutput("output_text")), 
               plotOutput("output_plot") 
      ),
      
      tabPanel("Imágenes Poswork 3",
               img(src ="cor_iris.png", width = 450, height = 450)     
      ), 
      
      ##########################################
      tabPanel("Data Table", dataTableOutput("datatable")),   # salida del data table
      #tabPanel("Table", tableOutput("table")),               # salida de la tabla
      ##########################################
      tabPanel("Factores",
               img(src ="escenarioMomiosMax.png", width = 450, height = 450),
               img(src ="escenarioMomiosPro.png", width = 450, height = 450)
      )
      
      #tabPanel("Summary", verbatimTextOutput("summary")),    # salida del Summary
    )
  ))

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$output_text <- renderText( {paste("Gráfico de Sepal.Length ~", input$x)}) #Titulo del main Panel
  
  output$output_plot <- renderPlot( {plot(as.formula(paste("Sepal.Length ~", input$x)),  #Gráficos de salida
                                          data = iris) })
  
  
#################################################################
  output$datatable <- renderDataTable( {matchdata <- read.csv("match.data.csv")},       #Data table
                                       options = list(aLengthMenu = c(10,20,50), 
                                       iDisplayLength = 10) ) 
  #output$table <- renderTable({ data.frame(matchdata <- read.csv("../match.data.csv"))})   # Data Frame
#################################################################  
  
  
  
  #output$summary <- renderPrint( {summary(iris)} )   # Summary
}

# Run the application 
shinyApp(ui = ui, server = server)





