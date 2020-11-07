
library(shiny)


shinyUI(fluidPage(
    
    
    titlePanel("Laboratorio #2 - Alvaro Esquivel"),
    
    
    #Grafica
    tabPanel('LAB2',
             plotOutput('plot',
                        click = 'click_plot',
                        dblclick = 'dblclck_plot',
                        hover = 'hover_plot',
                        brush = 'brush_plot'
             ),
             
             
             
             
    DT::dataTableOutput('tabla')
    )
    
))
