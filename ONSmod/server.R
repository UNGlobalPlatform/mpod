library(shiny)
library(shinydashboard)
library(fmsb)

# Define server logic for slider examples
shinyServer(function(input, output) {
  
  # Reactive expression to compose a data frame containing all of the values
  #sliderValues <- reactive({
  output$radarPlot <- renderPlot({
    
  # Data must be given as the data frame, where the first cases show maximum.
  # This section is create the data frame with the min/max numbers for each row
    maxmin <- data.frame(
      sensitivity=c(12, 0),
      indentifies=c(12, 0),
      granularity=c(12, 0),
      recency=c(12, 0),
      reliability=c(12, 0),
      release=c(12, 0),
      audience=c(12, 0)
    )
    
    # This populates dat with random numbers for the actual value
    dat <- data.frame(
      sensitivity=as.integer( c(input$sensitivity)),
      indentifies=as.integer( c(input$indentifies)),
      granularity=as.integer( c(input$granularity)),
      recency=as.integer( c(input$recency)),
      reliability=as.integer( c(input$reliability)),
      release=as.integer( c(input$release)),
      audience=as.integer( c(input$audience))
    )
  
  # Merges actual data with min/max data
    dat <- rbind(maxmin,dat)
    
    #op <- par(mar=c(1, 2, 2, 1),mfrow=c(2, 2))
  
    radarchart(dat, axistype=0, seg=3, plty=1, pfcol=rgb(0.2,0.5,0.5,0.5), vlabels=c("Sensitivity", "Indentifies",
                                                         "Granularity", "Recency", "Reliability", "Release", "Audience"),
               title="ONS MPoD Radar v1.1", vlcex=1.4)
    
    #par(op)
  
  # Show the values using an HTML table
  #output$values <- renderTable({
  #  sliderValues()
  #})
  })


  observeEvent(input$showsensitivity, {
    showModal(modalDialog(
      title = "Sensitivity",
      "This could be where we will explain in detail what is meant by Sensitivity and the catagories of Open Public, Commercial, Private Personal and Secret",
      easyClose = TRUE,
      footer = NULL
    ))
  })
  observeEvent(input$showindentifies, {
    showModal(modalDialog(
      title = "Indentifies",
      "This could be where we will explain in detail what is meant by Indentifies and the catagories of Non-Personal, Groups and Individuals",
      easyClose = TRUE,
      footer = NULL
    ))
  })
  observeEvent(input$showgranularity, {
    showModal(modalDialog(
      title = "Granularity",
      "This could be where we will explain in detail what is meant by Granularity and the catagories of Population, Sample, Record and Field Variable",
      easyClose = TRUE,
      footer = NULL
    ))
  })    
  observeEvent(input$showrecency, {
    showModal(modalDialog(
      title = "Recency",
      "This could be where we will explain in detail what is meant by Recency and the catagories of Historical, Periodic and Real-time",
      easyClose = TRUE,
      footer = NULL
    ))
  })    
  observeEvent(input$showreliability, {
    showModal(modalDialog(
      title = "Reliability",
      "This could be where we will explain in detail what is meant by Reliability and the catagories of Incomplete, Patchy, Substantial and Complete",
      easyClose = TRUE,
      footer = NULL
    ))
  })    
  observeEvent(input$showrelease, {
    showModal(modalDialog(
      title = "Release",
      "This could be where we will explain in detail what is meant by Sensitivity and the catagories of Closed, Restricted and Open",
      easyClose = TRUE,
      footer = NULL
    ))
  })    
  observeEvent(input$showaudience, {
    showModal(modalDialog(
      title = "Audience",
      "This could be where we will explain in detail what is meant by Audience and the catagories of Closed Group, Third Parties by type and Public",
      easyClose = TRUE,
      footer = NULL
    ))
  })

})