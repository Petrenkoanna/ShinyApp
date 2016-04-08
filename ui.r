library(shiny)
library(ggplot2)
a <- read.csv('http://hsequantling.wikispaces.com/file/view/all_words.csv', sep=",", encoding = "UTF-8")
shinyUI(
  fluidPage(
    titlePanel("One thousand Most Frequently Used Words"),
    fluidRow(
      column(4,
            selectInput("inp",
                         "Choose language:",
                         c("All languages",
                           unique(as.character(a$language))))
            ),
      mainPanel(
        textOutput("text")
      ) 
    ),
    fluidRow(
      DT::dataTableOutput("table")
    )
  )
)
