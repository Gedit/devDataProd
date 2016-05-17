
library(shiny)
library(datasets)

shinyServer(function(input, output) {
    
    output$plotOut <- renderPlot({
        
        # choose data based on input from ui.R
        temp <- subset(airquality, airquality$Month >= input$month[1] & airquality$Month <= input$month[2]) 
        x <- temp[,as.numeric(input$variable)]
        labs <- c("Ozone (ppb)", "Solar radiation", "Wind (mph)", "Temperature (F)")
        
        # plot the results:
        plot(x, type="l", ylab=labs[as.numeric(input$variable)])
        
        #annotate plot:
        abline(v=which(diff(temp$Month)==1), lty=3, col="grey", lwd=2)

    })
    
})
