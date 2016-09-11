server <- function(input, output) {
    library(caret)
    library(rpart)
    library(e1071)
#     # Create a Progress object
#     progress <- shiny::Progress$new()
#     # Make sure it closes when we exit this reactive, even if there's an error
#     on.exit(progress$close())
#     
#     progress$set(message = "Making plot", value = 0)
    
    

      
    
    
    prediction <- eventReactive(input$submitButton,{
        ## Load the necessary libraries
        library(caret)
        ##library(rattle)
        
        ## Load the Titanic dataset
        df <- read.csv("titanic.csv")
        
        ## To make sure the results are reproducible, a seed is set
        set.seed(12345)
        
        ## Only keep the columns that will be used for the prediction model
        df <- subset(df[,c("Survived","Pclass","Sex", "Age", "SibSp", "Parch", "Embarked")])
        
        df$Survived <- as.factor(df$Survived)
        df$Pclass <- as.factor(df$Pclass)
        df$Sex <- as.factor(df$Sex)
        df$Embarked <- as.factor(df$Embarked)
        
        
        ## Train the prediction model for this dataset
        control <- trainControl(method = "cv", number = 6)
        fit_classTree <- train(Survived ~ ., data = df, method = "rpart", 
                               trControl = control)
        #print(fit_classTree, digits = 4)
        #fancyRpartPlot(fit_classTree$finalModel)
        
        ## Reformat the input variables if needed
        Pclass <- input$Class
        Age <-input$Age
        Sex <- input$Sex
        SibSp <- as.integer(input$Sib) + as.integer(input$Spouse)
        Parch <- as.integer(input$Par) + as.integer(input$Ch)
        Embarked <- (substring(input$Embark, 1, 1))

        test <- data.frame(
            "Pclass" = as.factor(Pclass), 
            "Sex" = as.factor(Sex),
            "Age" = Age,
            "SibSp" = as.integer(SibSp),
            "Parch" = as.integer(Parch),
            "Embarked"= as.factor(Embarked)
        )
        
        # Apply the predict model using validation set to get the outcomes
        predict_classTree <- predict(fit_classTree, test)
        
        
        
        if(predict_classTree==1){
            paste("You have survived the trip!")
            
        }else {
            
            paste("You have died!")
        }
        
        #return(predict_classTree)
        
        
    })
    
    
    
    
    selection1 <- eventReactive(input$submitButton,{
        paste(
            "You have selected that you are a ", 
            input$Age,
            " year old ",
            input$Sex, 
            ". "

            )
        
       
    })
    selection2 <- eventReactive(input$submitButton,{
        paste(
                        "You are traveling with ", 
            input$Ch,
            " children,",
            input$Par,
            " parents,",
            input$Spouse,
            " spouses and",
            input$Sib,
            " siblings."
            
        )
        
        
    })
    selection3 <- eventReactive(input$submitButton,{
        paste(
            "You are traveling in class ",
            input$Class,
            " and have boarded at ",
            input$Embark,
            "."
        )
        
        
    })

    output$text1 <- prediction
    

    output$text2 <- selection1
    output$text3 <- selection2
    output$text4 <- selection3


    
    output$image1 <- 
        renderImage({
                return(list(
                    src = "TitanicImage.jpeg",
                    contentType = "image/jpef",
                    alt = "Titanic"
                ))
        }, deleteFile = FALSE)
    

}