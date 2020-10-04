#Laboratorio 1> Alvaro Esquivel
#Practica de inputs en shiny

library(shiny)
library(lubridate)
data(mtcars)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Laboratorio 1: Alvaro Esquivel"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider_input",
                        "Seleccione valor:",
                        value = 50,
                        min = 0,
                        max = 100,
                        step = 10,
                        post = '%',
                        animate = TRUE),
            
            #Slider input de rango 
            sliderInput("slider_input2",
                        "Seleccione un rango:",
                        value = c(0,200),
                        min = 0,
                        max = 200,
                        step = 10,
                        post = '%'),
            
            #Select input 
            selectInput("select_input",
                        "Seleccione un auto:",
                        choices = rownames(mtcars),
                        selected = "Camaro Z28",
                        multiple = FALSE),
            
            #Select multiple input 
            selectizeInput("select_input2",
                        "Seleccione un auto:",
                        choices = rownames(mtcars),
                        selected = "Camaro Z28",
                        multiple = TRUE),
            
            #Date input 
            dateInput("date_input",
                           "Seleccione la fecha:",
                           value = today(),
                           min = today()-60,
                            max = today()+30,
                            language = 'es',
                           weekstart = 1),
            
            #Date input en rangos
            dateRangeInput("date_range_input",
                      "Seleccione rangos de fecha:",
                      start = today()-7,
                      end = today(),
                      separator = 'a'),
            
            #Numeric input
            numericInput("numeric_input",
                           "Ingrese un numero:",
                           value = 10,
                         min = 0,
                         max = 100,
                         step = 1),
            
            #Check box input
            checkboxInput("checkbox_input",
                         "Seleccione checkbox input:",
                         value = FALSE),
            
            #Check box group input
            checkboxGroupInput("checkbox_group_input",
                          "Seleccione checkbox input:",
                          choices = LETTERS[1:5]),
            
            #Radio button
            radioButtons("radio_ex",
                         "Seleccione genero:",
                         choices = c("Masculino", "Femenino")),
            
            #Text input
            textInput("text_input",
                               "Ingrese Texto:"),
            
            #Password input
            passwordInput("pass_input",
                      "Ingrese su password:"),
            
            
            #Text area input
            textAreaInput("text_area_input",
                      "Ingrese Texto en area:"),
            
            actionButton("action_button", "ok"),
            
            actionLink("action_link", "Siguiente"),
            
            submitButton(text = "Reprocesar")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h2("Slider input sencillo"),
            #Imprime en el app tal y como aparece en consola
            verbatimTextOutput("slider-io"),
            
            h2("Slider input entre rango"),
            verbatimTextOutput("slider-io2"),
            
            h2("Select input"),
            verbatimTextOutput("select-io"),
            
            h2("Select multiple input"),
            verbatimTextOutput("select-io2"),
            
            h2("Select date"),
            verbatimTextOutput("date-io"),
            
            h2("Select date entre rangos"),
            verbatimTextOutput("date-io2"),
            
            h2("Numeric Input"),
            verbatimTextOutput("numeric-io"),
            
            h2("Chechbox Input"),
            verbatimTextOutput("checkbox-io"),
            
            h2("Chechbox Group Input"),
            verbatimTextOutput("checkbox-io2"),
            
            h2("Radio Input"),
            verbatimTextOutput("radio-io"),
            
            h2("Password Input"),
            verbatimTextOutput("pass-io"),
            
            h2("Text Input"),
            verbatimTextOutput("text-io"),
            
            h2("Text Area Input"),
            verbatimTextOutput("area-io"),
            
            h2("Action Button Input"),
            verbatimTextOutput("button-io"),
            
            h2("Link Button Input"),
            verbatimTextOutput("link-io")
        )
    )
))
