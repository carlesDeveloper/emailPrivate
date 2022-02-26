#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(sendmailR)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    observeEvent(input$fileToUpload,{

      myServerPath <- file.path(input$fileToUpload$datapath)
      browser()
      Server<-list(smtpServer= "smtp.example.io")
      
      library(sendmailR)
      from <- sprintf("<carles.lloret.ramon@gmail.com>","The Sender") # the sender’s name is an optional value
      to <- sprintf("<carles.lloret.ramon@gmail.com>")
      subject <- "Test email subject"
      body <- "Test email body"
      
      sendmail(from,to,subject,body,control=list(smtpServer= "smtp.example.io"))
    })

})
