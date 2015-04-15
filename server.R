library(shiny)

exp_num <- function(num1){
    E <- 0
    for(i in 1:num1) {
        E<- E+1/i
    }
    E <- E*num1
    E
}

st_col <- function(num1,num2,ss){
    vector<-rep(0,num1)
    set.seed(ss)
    stickers<-sample(1:num1,num2,replace=TRUE)
    for(i in 1:num1) {
        vector[i]<-sum(stickers==i)
    }
    vector
}

shinyServer(
    function(input,output){
        num1 <- reactive({input$sub1 
                          isolate(as.integer(input$num1))})
        output$num1 <- renderText(num1())
        output$exp <- renderText({exp_num(num1())})
        ss <- reactive({as.integer(input$sub2)})
        num2 <- reactive({ss()
                          isolate(as.integer(input$num2))})
        output$num2 <- renderText({num2()})
        v <- reactive({ss()
                       isolate(st_col(num1(),num2(),ss()))})
        output$vec <- renderPrint({as.vector(v())})
        output$max <- renderText({as.integer(max(v()))})
        output$zeros <- renderText({sum(v()==0)})
        output$quantile <- renderPrint({as.table(quantile(v()))})
    }
)

