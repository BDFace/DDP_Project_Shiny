# install.packages("devtools")
# library(devtools)
# devtools::install_github('rstudio/shinyapps')
# library(shiny)
# library(shinyapps)

heightchild <- function(hd) hd /2

shinyServer(
  function(input, output) {
    output$prediction <- renderPrint({heightchild(input$heightmum + input$heightdad)})
    output$son <- renderPrint({heightchild(input$heightmum + input$heightdad) +7.35})
    output$daughter <- renderPrint({heightchild(input$heightmum + input$heightdad -7.35)})
  }
)

#use runApp(display.mode="showcase") gives you the code its running live

# take the secret key from the website and paste the link into R to run the secret key
# then just run deplotApp() and you're away..
