library(shiny)
library(shinydashboard)
library(fmsb)

shinyUI(fluidPage(
  
  #tags$head(includeScript("bugherd.js"),tags$link(rel="shortcut icon",href="favicon.ico")),
  #titlePanel("Hello World"),
  
  #titlePanel("Hello World"),
  tags$img(src="ons-logo.png", width=180),
  #tags$div(),
  tags$h1("Material Properties of Data"),
  
# Define UI for slider demo application
shinyUI(pageWithSidebar(
  
  #  Application title
  tags$head(includeScript("bugherd.js"),tags$link(rel="shortcut icon",href="favicon.ico")),

  # Sidebar with sliders that demonstrate various available options
  sidebarPanel(
    
    selectInput("sensitivity", "Sensitivity:", 
                list("Open Public"=0,"Commercial"=4,"Private Personal"=8, "Secret"=12)),
    div(p(actionLink("showsensitivity", "", icon=(icon("question-circle", class = NULL, lib = "font-awesome"))),align="right",color="blue")),
    
    selectInput("indentifies", "Identifies:", 
                list("Non Personal"=0,"Groups"=6,"Individuals"=12)),  
    div(p(actionLink("showindentifies", "", icon=(icon("question-circle", class = NULL, lib = "font-awesome"))),align="right",color="red")),
    
    selectInput("granularity", "Granularity:",
                list("Population"=0,"Sample"=4,"Record"=8, "Field Variable"=12)),
    div(p(actionLink("showgranularity", "", icon=(icon("question-circle", class = NULL, lib = "font-awesome"))),align="right")),
    
    selectInput("recency", "Recency:",
                list("Historical"=0,"Periodic"=6,"Real-time"=12)),   
    div(p(actionLink("showrecency", "", icon=(icon("question-circle", class = NULL, lib = "font-awesome"))),align="right")),
    
    selectInput("reliability", "Reliability:",
                list("Incomplete"=0,"Patchy"=4,"Substantial"=8, "Complete"=12)),  
    div(p(actionLink("showreliability", "", icon=(icon("question-circle", class = NULL, lib = "font-awesome"))),align="right")),
    
    selectInput("release", "Release:",
                list("Closed"=0,"Restricted"=6,"Open"=12)),                              
    div(p(actionLink("showrelease", "", icon=(icon("question-circle", class = NULL, lib = "font-awesome"))),align="right")),
    
    selectInput("audience", "Audience:",
                list("Named"=0,"Closed Group"=4,"Third Parties by type"=8, "Public"=12)),
    div(p(actionLink("showaudience", "", icon=(icon("question-circle", class = NULL, lib = "font-awesome"))),align="right",color="blue"))
    
               
  ),
  
  mainPanel(
    plotOutput('radarPlot',height="800px", width="800px")
    )
  )
)
)
)