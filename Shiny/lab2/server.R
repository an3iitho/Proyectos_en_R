
library(shiny)
library(ggplot2)
library(dplyr)



shinyServer(function(input, output, session) {
    
    
    observeEvent(input$dist,{
        updateTabsetPanel(session,
                          inputId = 'params',
                          selected = input$dist
        )
    })
    
    output$plot_dist <- renderPlot({
        (dist_sample())
    })
    acciones_user <- reactive({
        
        i_click <-input$click_plot$x
        i_hover <- input$hover_plot$x
        d_click <- input$dblclck_plot$x
        i_brush <- input$brush_plot
        #Click
        if(!is.null(i_click)){
            df<-nearPoints(mtcars,
                            input$click_plot,
                            xvar='wt',
                            yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            controla_c <<- rbind(controla_c,out)
            return(out)
        }
        #Doble click
        if(!is.null(d_click)){
            df<-nearPoints(mtcars,
                           input$dblclck_plot,
                           xvar='wt',
                           yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            controla_c <<- setdiff(controla_c,out)
            return(puntos_hover)
        }
        #En Hover
        if(!is.null(i_hover)){
            df<-nearPoints(mtcars,
                           input$hover_plot,
                           xvar='wt',
                           yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            puntos_hover <<- out
            return(puntos_hover)
        }
        #Seleccion
        if(!is.null(i_brush)){
            df<-brushedPoints(mtcars,
                              input$brush_plot,
                              xvar='wt',
                              yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            controla_c <<- rbind(controla_c,out)
            return(puntos_hover)
        }
        
        
        
    })
    puntos_hover <- NULL

    mtcars_plot <- reactive({
        #Genera grafica por accion
        plot(mtcars$wt, 
             mtcars$mpg,
             xlab="Peso",
             ylab="Millas por galon")
        acciones_user <-acciones_user()
        if(!is.null(puntos_hover)){
            points(
                puntos_hover[,1],
                puntos_hover[,2],
                   col=152, #en gris
                   cex = 1.5, #Aumento
                   pch=19)} #Simbolo
        if(!is.null(controla_c)){
            points(controla_c[,1],
                   controla_c[,2],
                   col=11, #En verde
                   cex = 1.5, #Aumento
                   pch=19)} #Simbolo

    })
    
    output$plot <- renderPlot({
        
        mtcars_plot()
    })
    controla_c <- NULL
    
    obj_seleccionados <- reactive({
        input$click_plot$x
        input$dblclck_plot$x
        input$brush_plot
        controla_c
    })
    
    inicio <- TRUE
    
    #Generacion de tabla con DT
    output$tabla <- DT::renderDataTable({
        obj_seleccionados() %>% DT::datatable()
    })
    
})