library(shiny)
# library(fmsb)
library(plotly)
library(shinysurveys)

df <- data.frame(
  question = c(
                #Questions on importance
                rep("How important is planning and managigng data for your research?", 5),
                rep("How important is creating new data for your research?", 5),
                rep("How important is reusing existing data for your research?", 5),
                rep("How important is cleaning and processing data for your research?",5),
                rep("How important is archiving and preserving data for your research?",5),
                rep("How important is using and analysing data for your research?",5),
                rep("How important is publishing and sharing data for your research?",5),
                # #Questions on importance
                rep("How confident are you in planning and managing a project which uses multdimensional media?", 5),
                rep("How confident are you in creating multdimensional media?", 5),
                rep("How confident are you in reusing multdimensional media available from other sources?", 5),
                rep("How confident are you in cleaning and processing multdimensional media?", 5),
                rep("How confident are you in archiving and preserving multdimensional media?", 5),
                rep("How confident are you in using and analysing multdimensional media?", 5),
                rep("How confident are you in publishing and sharing multdimensional media?", 5),
                #Questions on specific technologies
                rep("How confident are you in structuring information, for example deciding what metadata to use?", 5),
                rep("How confident are you in creating multidimensional data, for example images and 3D models?", 5),
                rep("How confident are you in searching and downloading multidimensional data, for example using archives of images?", 5),
                rep("How confident are you in manipulating multidimensional data, for example downloading, naming files?", 5)

                #                "What's your favorite food?",
               # rep("Goat cheese is the GOAT.", 5),
               # rep("Yogurt and berries are a great snack.",5),
               # rep("SunButter® is a fantastic alternative to peanut butter.", 5)
               ),
  option = c(
              rep(c("Not important", "Slightly important", "Neither", "Very important", "Extremely important"), 7),
              # rep(c("Not important", "Slightly important", "Neither", "Very important", "Extremely important"), 7),
              rep(c("Wouldn't know where to start", "I have basic awarness", "I can do most basic things", "I am able to do most things", "I consider myself an expert"), 7),
              rep(c("Wouldn't know where to start", "I have basic awarness", "I can do most basic things", "I am able to do most things", "I consider myself an expert"), 1)
              # "text",
             # rep(c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree"), 3)
             ),
  input_type = c(
                rep("matrix", 35),
                rep("matrix", 35),
                rep("matrix", 5)
                # rep("matrix", 5)
                # "text",
                 # rep("matrix", 15)
                ),
  # For matrix questions, the IDs should be the same for each question
  # but different for each matrix input unit
  input_id = c(
              # rep("matId1", 5)
               rep("matId1", 35),
               rep("matId2", 35),
               rep("matId3", 5)

               # "favorite_food",
               # rep("matId2", 15)
               ),
  dependence = NA,
  dependence_value = NA,
  required = FALSE
)


# Define UI for app that draws a histogram ----
ui <- fluidPage(


  tags$head(
    # Note the wrapping of the string in HTML()
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css?family=Hanken%20Grotesk');
      body {
        font-family:'Hanken Grotesk';
        font-style: normal;
        font-weight: 400px;
        font-size: 12px;
      }
      h2 {
        font-family: 'Hanken Grotesk, serif;
      }
      .title{
      aligh: auto;
      }
      .mydiv{
        width: 100%;
        aligh: auto;
        text-align: left;
      }
      p {
        font-family:'Hanken Grotesk';
        font-style: normal;
        font-weight: 400px;
        font-size: 12px;
      }
      .shiny-input-container {
        color: #474747;
      }"
      ))
  ),



  # Sidebar layout with input and output definitions ----
  # sidebarLayout(
  #
  #   # Sidebar panel for inputs ----
  #   sidebarPanel(
  #     h2("hello"),
  #     p("this is my text")
  #   ),
  #
  #   # Main panel for displaying outputs ----
  #   mainPanel(
  # tags$div(class="title",  img(src = "https://culturedigitalskills.org/wp-content/uploads/colorcentre-1.png", width=200)),

  tags$div(class="title",  img(src = "https://culturedigitalskills.org/wp-content/uploads/colorcentre-1.png", width=200)),
  p("Hello World"),

  surveyOutput(df = df,
                   survey_title = "Digital Skills Self-Assement",
                   survey_description =   tags$div(class="title",
                                                   # img(src = "https://culturedigitalskills.org/wp-content/uploads/colorcentre-1.png", width=200),
                                                   p("This survey, designed by the Centre on Visual and Material Culture,
                                                     will help you to identify the digital skills you need to focus on."),
                                                   # br(),
                                                   ),
                      # p(img(src = "https://culturedigitalskills.org/wp-content/uploads/colorcentre-1.png", width=200),
                      #
                      #                       br(),
                      #                       br(),
                      #                       "example text",
                      #
                      #                       br(),
                      #                       "next line text"),
                   # theme = "#e29055"
                   ),


      # Output: Histogram ----
  # tags$style(
  #   ".mygraph {
  #       width: 70px;
  #       height: 300px;
  #       border: 1px solid #c3c3c3;
  #       display: flex;
  #       flex-wrap: wrap;
  #       align-content: center;
  #       }"
  # ),
  #     div(class = "mygraph",p("aaa")),
  #   plotlyOutput('radialPlot'),

  # tags$style(
  #   ".first-p {
  #     color: red;
  #     flex-wrap: wrap;
  #     align-content: center;
  #     border: 1px solid #c3c3c3;
  #   }
  #   #element {
  #     color: blue;
  #     border: 1px solid #FFFFFF;
  #     bg-color:solid #c3c3c3;
  #   }
  #   "
  # ),
  # p(class = "first-p", "Hello World"),
  # p("Another text"),
  # div(id = "element", "A block")
  #
  #     # plotOutput(outputId = "radialPlot")
  #
  #   # )
  # )
  )
# )
# Define server logic required to draw a histogram ----
server <- function(input, output) {
  renderSurvey()

  observeEvent(input$submit, {
    showModal(modalDialog(
      title = "Congrats, you completed your first shinysurvey!",
      "You can customize what actions happen when a user finishes a survey using input$submit.",
      input$matId1

    ))
    input$matId1
    output$radialPlot <- renderPlotly(
      {
      # # Demo data
      # exam_scores <- data.frame(
      #   row.names = c("Student.1", "Student.2", "Student.3"),
      #   Biology = c(7.9, 3.9, 9.4),
      #   Physics = c(10, 20, 0),
      #   Maths = c(3.7, 11.5, 2.5),
      #   Sport = c(8.7, 20, 4),
      #   English = c(7.9, 7.2, 12.4),
      #   Geography = c(6.4, 10.5, 6.5),
      #   Art = c(2.4, 0.2, 9.8),
      #   Programming = c(0, 0, 20),
      #   Music = c(20, 20, 20)
      # )
      #
      #
      # radarchart(
      #   exam_scores, axistype = 1,
      # )

      s <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/school_earnings.csv")
      # order factor levels by men's income (plot_ly() will pick up on this ordering)
      s$School <- factor(s$School, levels = s$School[order(s$Men)])

      # fig <- plot_ly() %>%
      #   add_lines(x = c("a","b","c"), y = c(1,3,2)) %>%
      #   layout(title="sample figure", xaxis = list(title = 'x'), yaxis = list(title = 'y'), plot_bgcolor = "#c7daec")

      fig <- plot_ly(s, color = I("gray80"),width = 80, height = 100)

      # fig <- fig %>% add_segments(x = ~Women, xend = ~Men, y = ~School, yend = ~School, showlegend = FALSE)
      # fig <- fig %>% add_markers(x = ~Women, y = ~School, name = "Women", color = I("pink"))
      # fig <- fig %>% add_markers(x = ~Men, y = ~School, name = "Men", color = I("blue"))
      # fig <- fig %>% layout(
      #   title = "Digital skills gaps",
      #   xaxis = list(title = "Annual Salary (in thousands)"),
      #   margin = list(l = 65)
      # )

    },


    )
  })


}
shinyApp(ui = ui, server = server)

