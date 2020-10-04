#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    #Slider input
    output$'slider-io' <- renderText({

        paste0( c('Output Slider input: ', input$slider_input), collapse = '' )

    })
    
    #Slider input en rango
    output$'slider-io2' <- renderText({
        
        paste0( c('Output Slider en rango: ', input$slider_input2[1], ' ', input$slider_input2[2]), collapse = '' )
        
    })
    
    #Select input 
    output$'select-io' <- renderText({
        
        paste0( c('Select: ', input$select_input, ' '), collapse = '' )
        
    })
    
    #Select input multiple
    output$'select-io2' <- renderText({
        
        paste0( c('Select: ', paste0(input$select_input2, collapse = ', '), ' '), collapse = '' )
        
    })
    
    #Select date
    output$'date-io' <- renderText({
        
        paste0( c('Fecha: ', as.character(input$date_input,
                                     format = "%d-%m-%Y"), ' '), collapse = '' )
        
    })
    
    #Select date en rangos
    output$'date-io2' <- renderText({
        
        paste0( c('Fecha: ', as.character(input$date_range_input[1],
                                          format = "%d-%m-%Y"), ' a ',
                as.character(input$date_range_input[2],
                             format = "%d-%m-%Y"), ' '), collapse = '' )
        
    })
    
    #Numeric input
    output$'numeric-io' <- renderText({
        
        paste0( c('Numeric input: ', input$numeric_input), collapse = '' )
        
    })
    
    #Checkbox input
    output$'checkbox-io' <- renderText({
        
        paste0( c('Checkbox input: ', input$checkbox_input), collapse = '' )
        
    })
    
    #Checkbox Group input
    output$'checkbox-io2' <- renderText({
        
        paste0( c('Checkbox Group input: ', paste0(input$checkbox_group_input, collapse = ", ")), collapse = '' )
        
    })

    #Radio input
    output$'radio-io' <- renderText({
        
        paste0( c('Text input: ', input$radio_ex), collapse = '' )
        
    })
    
    
    #Password input
    output$'pass-io' <- renderText({
        
        paste0( c('Text input: ', input$pass_input), collapse = '' )
        
    })
    
    #Text input
    output$'text-io' <- renderText({
        
        paste0( c('Text input: ', input$text_input), collapse = '' )
        
    })
    
    
    
    #Text area input
    output$'area-io' <- renderText({
        
        paste0( c('Text area input: ', input$text_area_input), collapse = '' )
        
    })
    
    
    
    #Text button input
    output$'button-io' <- renderText({
        
        paste0( c('Button input: ', input$action_button), collapse = '' )
        
    })
    
    
    #Link button input
    output$'link-io' <- renderText({
        
        paste0( c('Link input: ', input$action_link), collapse = '' )
        
    })
    
    
})
