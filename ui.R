library(shiny)
library(shinydashboard)
library(datasets)
library(plotly)


title <- tags$a(href='https://www.google.com',
                tags$img(src="https://i.ibb.co/mFB0sdG/default-vignette-job.png", height = '50', width = '200'),
                target="_blank")

shinyUI(
  dashboardPage(skin = "yellow",
                dashboardHeader(title = title, titleWidth = 230),
                
                
                
                dashboardSidebar(
                  sidebarMenu(
                    menuItem("‎ Tableau de données", tabName = "data", icon = icon("database")),
                    menuItem("‎ Tableau de données codifiées", tabName = "datarecoded", icon = icon("server")),
                    menuItem("‎ Tableau de bord", tabName = "piechart", icon = icon("chart-simple")),
                    menuItem("‎ AFC", tabName = "AFC", icon = icon("magnifying-glass-chart"),
                             menuSubItem('‎ Ville et Superficie',
                                         tabName = 'chart1',
                                         icon = icon('line-chart')),
                             menuSubItem('‎ Ville et Prix',
                                         tabName = 'chart2',
                                         icon = icon('line-chart')),
                             menuSubItem('‎ Ville et Prix du m²',
                                         tabName = 'chart3',
                                         icon = icon('line-chart'))),
                    menuItem("‎ MAP", tabName = "map", icon = icon("map"))

                  )
                  
                  
                  
                ),
                
                
                dashboardBody(
                  tabItems(
                    
                    tabItem(tabName = "data", DT::dataTableOutput("data_alomrane")),
                    tabItem(tabName = "datarecoded", DT::dataTableOutput("data_alomrane2")),
                    tabItem(tabName="map",actionButton("mapButton", "OUVRIR HEAT MAP", style="color: #fff; background-color: #3C8DBC; margin-left:325px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                    tabItem(tabName="piechart",
                            fluidRow(valueBoxOutput("inline"),valueBoxOutput("inline2"),valueBoxOutput("inline3")),

                            fluidRow(box(title="Villes",status = "warning", solidHeader = TRUE,plot_ly(VILLE_ALL, labels = ~VILLE, type = "pie",height=350)),
                                     box(title="Prix",status = "warning", solidHeader = TRUE,plot_ly(RECODED, x = ~PRIX, type = "histogram",height=350))),
                            fluidRow(box(title="Superficie",status = "success", solidHeader = TRUE,plot_ly(RECODED, x = ~SUPERFICIE, type = "histogram",height=350),h3(strong("Légende:")), br(), strong("T1 : entre 0M² ET 45M²"), br(), strong("T2 : entre 45M² ET 65M²"), br(), strong("T3 : entre 65M² ET 80M²"), br(), strong("T4 : entre 80M² ET 100M²"), br(), strong("T5 : entre 100M² ET 200M²"), br(), strong("T6 : Plus que 200M²")),
                                     box(title="Prix M²",status = "success", solidHeader = TRUE,plot_ly(RECODED, x = ~PRIXM2, type = "histogram",height=350))),
                            fluidRow(box(title="Nombre de Pièces",status = "info", solidHeader = TRUE,plot_ly(RECODED, labels = ~PIECES, type = "pie",height=350)),
                                     box(title="Nombre de Salles de Bain",status = "info", solidHeader = TRUE,plot_ly(RECODED, labels = ~SDB, type = "pie",height=350))),
                            fluidRow(box(title="Meublé ou non",status = "danger", solidHeader = TRUE,plot_ly(RECODED, labels = ~MOBILIERS, type = "pie",height=350)),
                                     box(title="Année d'annonce",status = "danger", solidHeader = TRUE,plot_ly(ANNEE, labels = ~ANNEE, type = "pie",height=350)))
                            
                            
                    ),
                    
                    tabItem(tabName = "chart1",
                            fluidRow(
                              tabBox(
                                title = "Biplot",width="100%",height=1100,
                                id = "tabset1",
                                tabPanel("MAROC",
                                         fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc1_1"))),
                                                  box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc1_2")),
                                                  box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc1_3"))),
                                         fluidRow(actionButton(inputId = "runButton", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto1")),
                                tabPanel("Casablanca",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa1_1"))),
                                                               box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa1_2")),
                                                               box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa1_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Casa_1", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto2")),
                                tabPanel("Marrakech",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech1_1"))),
                                                              box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech1_2")),
                                                              box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech1_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Kech_1", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto3")),
                                tabPanel("Fes",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes1_1"))),
                                                        box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes1_2")),
                                                        box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes1_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Fes_1", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto4"))
                              )),
                            fluidRow(
                              tabBox(
                                title = "Valeurs propres",width="100%",
                                id = "tabset2",
                                tabPanel("MAROC",plotOutput("caPlotMaroc3")),
                                tabPanel("Casablanca",plotOutput("caPlotCasa3")),
                                tabPanel("Marrakech",plotOutput("caPlotKech3")),
                                tabPanel("Fes",plotOutput("caPlotFes3"))
                                
                              )
                            )
                    ),
                    
                    tabItem(tabName = "chart2",
                            fluidRow(
                              tabBox(
                                title = "Biplot",width="100%",height=1100,
                                id = "tabset3",
                                tabPanel("MAROC",
                                         fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc2_1"))),
                                                  box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc2_2")),
                                                  box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc2_3"))),
                                         fluidRow(actionButton(inputId = "runButton2", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto5")),
                                tabPanel("Casablanca",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa2_1"))),
                                                               box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa2_2")),
                                                               box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa2_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Casa_2", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto6")),
                                tabPanel("Marrakech",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech2_1"))),
                                                              box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech2_2")),
                                                              box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech2_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Kech_2", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto7")),
                                tabPanel("Fes",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes2_1"))),
                                                        box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes2_2")),
                                                        box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes2_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Fes_2", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto8"))
                              )),
                            fluidRow(
                              tabBox(
                                title = "Valeurs propres",width="100%",
                                id = "tabset4",
                                tabPanel("MAROC",plotOutput("caPlotMaroc4")),
                                tabPanel("Casablanca",plotOutput("caPlotCasa4")),
                                tabPanel("Marrakech",plotOutput("caPlotKech4")),
                                tabPanel("Fes",plotOutput("caPlotFes4"))
                                
                              )
                            )
                    ),
                    
                    tabItem(tabName = "chart3",
                            fluidRow(
                              tabBox(
                                title = "Biplot",width="100%",height=1100,
                                id = "tabset5",
                                tabPanel("MAROC",
                                         fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc3_1"))),
                                                  box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc3_2")),
                                                  box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotMaroc3_3"))),
                                         fluidRow(actionButton(inputId = "runButton3", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto9")),
                                tabPanel("Casablanca",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa3_1"))),
                                                               box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa3_2")),
                                                               box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotCasa3_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Casa_3", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto10")),
                                tabPanel("Marrakech",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech3_1"))),
                                                              box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech3_2")),
                                                              box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotKech3_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Kech_3", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto11")),
                                tabPanel("Fes",fluidRow(fluidRow(box(width=12,title="Dimension 1 et 2",status="primary",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes3_1"))),
                                                        box(title="Dimension 2 et 3",status="success",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes3_2")),
                                                        box(title="Dimension 1 et 3",status="warning",collapsible=TRUE,solidHeader=TRUE,plotOutput("caPlotFes3_3"))),
                                         fluidRow(actionButton(inputId = "runButton_Fes_3", label = "INTERPRéTATION",style="color: #fff; background-color: #3C8DBC; margin-left:280px; width: 50%; padding: 5px; border-radius:10px; font-size:20px; text-transform:uppercase")),
                                         plotOutput("Auto12"))
                              )),
                            fluidRow(
                              tabBox(
                                title = "Valeurs propres",width="100%",
                                id = "tabset6",
                                tabPanel("MAROC",plotOutput("caPlotMaroc5")),
                                tabPanel("Casablanca",plotOutput("caPlotCasa5")),
                                tabPanel("Marrakech",plotOutput("caPlotKech5")),
                                tabPanel("Fes",plotOutput("caPlotFes5"))
                                
                              )
                            )
                    )
                    
                    
                  )
                )
                
  )
)
