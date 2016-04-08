library(shiny)
library(ggplot2)
library(DT)
a <- read.csv('http://hsequantling.wikispaces.com/file/view/all_words.csv', sep=",", encoding = "UTF-8")
shinyServer(function(input, output) {
  output$text <- renderText({ 
    paste("Это приложение показывает 1000 самых частотных слов некоторых языков. Данные основаны на материалах сайта http://www.101languages.net/common-words/. Нельзя гарантировать, что данные собраны хорошо (процесс сбора данных на сайте не описан), ровно как и не стоит верить переводам.", input$var)
  })
  output$table <- DT::renderDataTable(DT::datatable({
    data <- a
    if (input$inp != "All languages") {
      data <- data[data$language == input$inp,]
    }
    data
  }))
})