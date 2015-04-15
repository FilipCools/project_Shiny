library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("App for sticker albums"),
    sidebarPanel(
        tabsetPanel(
            tabPanel("App", value=1), 
            tabPanel("Documentation", value=2),
            id = "conditionedPanels"
            ),
        br(),br(),
        conditionalPanel(condition="input.conditionedPanels==1",
            textInput(inputId="num1",label="Total number of stickers in album",value="1"),
            actionButton("sub1","Submit"),
            #submitButton("Submit"),
            br(),
            br(),
            br(),
            h5("Try it out yourself and create a virtual sticker collection 
               (generated at random) for an album with n stickers!"),
            textInput(inputId="num2",label="Number of stickers in your collection:",value="0"),
            actionButton("sub2","Submit")         
            ),
        conditionalPanel(condition="input.conditionedPanels==2",
            helpText("A popular leisure activity for children (but also adults), 
            especially during sport tournaments such as the soccer world cup, 
            is to get an empty sticker album and to buy/collect stickers to fill 
            in the album."),
            helpText("With this app, you can compute the expected number of stickers 
            you will have to buy/collect in order to get a full album. The input n is
            the number of stickers in a full album."),
            a(href="http://en.wikipedia.org/wiki/Coupon_collectors_problem", 
              "Reference : wikipedia 'Coupon collectors problem'"),
            helpText("Example: the Panini 'Fifa World Cup Brasil' album had n=640
                     stickers to fill in. For this album, the expected number is 4505.258."),
            helpText("Note : this is under the assumption that you are not 
            swapping stickers with friends."),
            helpText("You can also try this out yourself : create a virtual sticker 
            collection (generated at random) and check whether your album is full or not. Here, the 
            input is the number of stickers in your collection. The number of stickers 
            in the album is still n.")
            )        
        ),
    mainPanel(
        conditionalPanel(condition="input.conditionedPanels==1",
            br(),br(),br(),br(),
            h5('You entered : total number of stickers in album = n ='), 
            verbatimTextOutput("num1"), 
            h5('Expected number of stickers to collect for a full album = n*(1/1+1/2+...+1/n) ='),
            verbatimTextOutput("exp"),
            br(),
            h5('You entered : number of stickers in your collection ='),
            verbatimTextOutput("num2"),
            h5('Your virtual sticker collection as a vector (where 
               the first entry indicates the number of times you have the first sticker, etc.):'),
            verbatimTextOutput("vec"),
            h5('Quantiles:'),
            verbatimTextOutput("quantile"),
            h5('Numbers of stickers missing for a full book:'),
            verbatimTextOutput("zeros")
        ),
        conditionalPanel(condition="input.conditionedPanels==2", 
            br(),br(),br(),br(),br(),br(),         
            img(src="panini1.jpg",height="200px"),
            img(src="panini2.jpg",height="200px")
            )
        )
    )
)