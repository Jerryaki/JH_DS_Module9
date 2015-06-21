library(shiny)

shinyUI(fluidPage(theme = "bootstrap.css",
                  
    titlePanel("Nifty Total Bill Calculator"),
    
    h4("Instructions"),
    h5("Welcome! Use this Shiny app to calculate how much you owe on a bill, inclusive of tip."),
    h5("This app can also be used to determine the amount of an even splt amongst friends sharing the bill."),
    h5("Follow these steps to use this app:"),
    h5("1) Enter the bill total."),
    h5("2) Select the tip amount. In the U.S., 15%, 18% and 20% are common tip percentages."),
    h5("3) If you would like to specify another percentage, please select Other and enter the specific percentage in the text field below it."),
    h5("4) Select the number of guests splitting the bill."),
    h5("5) Click the Submit button. The amount each guest owes will now be displayed on the right."),
    h5("____________________________________________________________________________________________________________________________________________"),
    
    sidebarPanel(
        textInput("total", label = h4("Enter bill subtotal:"), value = 0),
        radioButtons("tip_perc", label = h4("Select tip percentage:"),
                     choices = list("15%" = 0.15, "18%" = 0.18, "20%" = 0.20, "Other" = 0), selected = 0.15),
        textInput("other_tip_perc", label = h5("Enter other tip percentage:"), value = "0"),
        numericInput("people", label = h4("Enter the number of guests:"), value = 1),
        submitButton('Submit')
    ),

    mainPanel(
        h3('Your results:'),
        h4('Subtotal entered'),
        verbatimTextOutput("input"),
        h4('Tip percentage entered'),
        verbatimTextOutput("tip_perc"),
        h4('Total amount due per guest:'),
        verbatimTextOutput("result")
    )
    
))