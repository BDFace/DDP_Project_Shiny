shinyUI(pageWithSidebar(
    headerPanel("Child's height estimate based on parent height"),
      sidebarPanel(

      numericInput('heightdad', 'Height of father (cm)', 185.6, min = 100, max = 400, step = 5),
      numericInput('heightmum', 'Height of mother (cm)', 170.9, min = 100, max = 400, step = 5),

      checkboxInput(inputId = "son",
                    label = strong("Son"),
                    value = FALSE),

      checkboxInput(inputId = "daughter",
                    label = strong("Daughter"),
                    value = FALSE),

      submitButton('Submit')
    ),

    mainPanel(
      tabsetPanel(
        tabPanel("App",
      h3('Average child height based on height of the parents'),
      h4('On average a child born to parents of the given heights would grow to a height (cm) of: '),
      verbatimTextOutput("prediction"),

      # display only if son box is ticked
      conditionalPanel(condition = "input.son == true",
                       h4('A son would on average grow to a height (cm) of: '),
                       verbatimTextOutput("son")),

      # display only if daughter box is ticked
      conditionalPanel(condition = "input.daughter == true",
                       h4('A daughter would on average grow to a height (cm) of: '),
                       verbatimTextOutput("daughter"))
      ),

      tabPanel("Documentation",
               h4('The app is intended to show a prediction for a childs height based on the heights of the parents.'),
               p('The user needs to add in the height of the father and height of the mother and check the box for
                  if they want to know the predicted height of a son, a daughter or both. The app will run a simple
                  calculation (note. this is not based of any real data of childrens heights but just a simple sum
                  to shows the functions are working) and show the average expected height of a child. If the check
                  boxes are ticked a calculation for a son and/or a daughter will also appear'),
               p('The ui.R and server.R files can be found at the following github site: https://github.com/BDFace/DDP_Project_Shiny')
               )
      )
    )
  )
)
