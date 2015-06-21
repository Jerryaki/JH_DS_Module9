library(shiny)

final_tip_perc <- function(percent, other){
    if( percent > 0){
        percent
    }else{
        other / 100
    }
}

tip_calc <- function(amount, percent, people){
        round((amount * (1 + percent)) / people, digits = 2)
}

shinyServer(
    function(input, output) {
        #Converting inputs into numbers for calculations
        totalConv <- reactive({as.numeric(input$total)})
        percConv <- reactive({as.numeric(input$tip_perc)})
        otherConv <- reactive({as.numeric(input$other_tip_perc)})

        #Performing calculations and outputting results
        output$input <- renderPrint({totalConv()})
        output$tip_perc <- renderPrint({final_tip_perc(percConv(), otherConv())})
        output$result <- renderPrint({tip_calc(totalConv(), final_tip_perc(percConv(), otherConv()), input$people)})
    }    
)