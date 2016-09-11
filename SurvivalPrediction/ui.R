
library(shiny)
library(caret)

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))



ui <- fluidPage(
    headerPanel('Would you have survived the Titanic?'),
    sidebarPanel(
        radioButtons('Sex', 'What is your sex?', c('male', 'female')),
        numericInput('Age','How old are you?', value = 1, min = 1, max = 116),
        selectInput('Sib','How many siblings would be on board with you?',choices = c(0,1,2,3,4,5,6,7,8,9,10), selected = 0 ),
        selectInput('Spouse','How many spouses would be on board with you?',choices = c(0,1,2,3,4,5,6,7,8,9,10), selected = 0 ),
        selectInput('Par','How many parents would be on board with you?',choices = c(0,1,2,3,4,5,6,7,8,9,10), selected = 0 ),
        selectInput('Ch','How many children would be on board with you?',choices = c(0,1,2,3,4,5,6,7,8,9,10), selected = 0 ),
        radioButtons('Class', 'What class would you stay in?', c(1,2,3)),
        radioButtons('Embark', 'Where would you embark?', c('Cherbourg','Queenstown','Southampton')),

        actionButton("submitButton", "Will you survive?")
    ),
    
    mainPanel(
        imageOutput('image1'),
        textOutput('text2'),
        textOutput('text3'),
        textOutput('text4'),
        textOutput('text1'),

        tags$head(tags$style("#text1{color: red;
                                 font-size: 20px;
                             font-style: italic;
                             }"
                         )
        )

    )
)