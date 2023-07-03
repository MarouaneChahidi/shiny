library(shiny)
library(shinydashboard)

shinyServer(function(input, output, session){
  
  output$data_alomrane <- DT::renderDataTable(
    NEW_DATA_RELEVANT_ONLY, extensions = 'Buttons' , options = list(dom= 'Bfrtip', buttons = list('copy','pdf','csv','excel','print'))
  )
  output$data_alomrane2 <- DT::renderDataTable(
    RECODED,  extensions = 'Buttons' , options = list(dom= 'Bfrtip', buttons = list('copy','pdf','csv','excel','print'))
  )
  output$data_alomrane3 <- renderDataTable({
    NEW_DATA_RELEVANT_ONLY
  })
  
  
  output$inline <- renderValueBox({
    valueBox(4833, "Entrées de données", icon = icon("chart-simple"))
  })
  output$inline2 <- renderValueBox({
    valueBox(78, "Villes différentes", icon = icon("chart-simple"),color='yellow')
  })
  output$inline3 <- renderValueBox({
    valueBox(458, "Emplacements différents", icon = icon("chart-simple"),color='red')
  })
  
  #MAROC
  
  output$caPlotMaroc1_1 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(1, 2))
  })
  
  output$caPlotMaroc1_2 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(2, 3))
  })
  
  output$caPlotMaroc1_3 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(1, 3))
  })
  
  output$caPlotMaroc2_1 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(1, 2))
  })
  
  output$caPlotMaroc2_2 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(2, 3))
  })
  
  output$caPlotMaroc2_3 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(1, 3))
  })
  
  output$caPlotMaroc3_1 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(1, 2))
  })
  
  output$caPlotMaroc3_2 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(2, 3))
  })
  
  output$caPlotMaroc3_3 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE, axes = c(1, 3))
  })
  
  
  output$caPlotMaroc3 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotMaroc4 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotMaroc5 <- renderPlot({
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  #FES
  
  output$caPlotFes1_1 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotFes1_2 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotFes1_3 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotFes2_1 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotFes2_2 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotFes2_3 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotFes3_1 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotFes3_2 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotFes3_3 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotFes3 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotFes4 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotFes5 <- renderPlot({
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  #CASABLANCA
  
  output$caPlotCasa1_1 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotCasa1_2 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotCasa1_3 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotCasa2_1 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotCasa2_2 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotCasa2_3 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotCasa3_1 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotCasa3_2 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotCasa3_3 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotCasa3 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotCasa4 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotCasa5 <- renderPlot({
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  #MARRAKECH
  
  output$caPlotKech1_1 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotKech1_2 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotKech1_3 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotKech2_1 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotKech2_2 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotKech2_3 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotKech3_1 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 2))
  })
  
  output$caPlotKech3_2 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(2, 3))
  })
  
  output$caPlotKech3_3 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_ca_biplot(res.ca, repel=TRUE,axes = c(1, 3))
  })
  
  output$caPlotKech3 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotKech4 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  output$caPlotKech5 <- renderPlot({
    res.ca <- CA(table(MARRAKECH_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, MARRAKECH_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    fviz_screeplot (res.ca, addlabels = TRUE, ylim = c(0, 80))
  })
  
  
  observeEvent(input$runButton, {
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    output$Auto1 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Casa_1, {
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    output$Auto2 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Kech_1, {
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    output$Auto3 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Fes_1, {
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$SUPERFICIE), graph = FALSE, ncp = Inf)
    output$Auto4 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton2, {
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIX), graph = FALSE, ncp = Inf)
    output$Auto5 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Casa_2, {
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    output$Auto6 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Kech_2, {
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIX), graph = FALSE, ncp = Inf)
    output$Auto7 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Fes_2, {
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIX), graph = FALSE, ncp = Inf)
    output$Auto8 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton3, {
    res.ca <- CA(table(VILLE_ALL$VILLE, VILLE_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    output$Auto9 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Casa_3, {
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    output$Auto10 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Kech_3, {
    res.ca <- CA(table(CASABLANCA_TOP20_EMPLACEMENTS_ALL$EMPLACEMENT, CASABLANCA_TOP20_EMPLACEMENTS_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    output$Auto11 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  observeEvent(input$runButton_Fes_3, {
    res.ca <- CA(table(FES_ALL$EMPLACEMENT, FES_ALL$PRIXM2), graph = FALSE, ncp = Inf)
    output$Auto12 <- renderPlot({
      Investigate(res.ca, file = "CA.Rmd", document = "html_document")
    })
  })
  
  
  observeEvent(input$mapButton, {
    browseURL("https://public.tableau.com/app/profile/marouane.chahidi/viz/MAP_16874669259480/Sheet1")
  })
  
  
  
}
)




