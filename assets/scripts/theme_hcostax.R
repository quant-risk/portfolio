
# https://rpubs.com/mclaire19/ggplot2-custom-themes


# building a theme plot

# hex color for a theme
# 
# #86e100 - green
# #fcfcfc - white
# #0073fe - cyan blu

# The palette with 8 color:
hcostaxpalette <- c("#fcfcfc", "#0073fe", "#86e100",
                    "#5b00e1", "#fe0073", "#fe8b00",
                    "#f2fe00", "#fe0c00")



suppressMessages(library(tidyverse))       # collection of packages
suppressMessages(library(scales))          # Scale Functions for Visualization
suppressMessages(library(ggdark))          # pacote com tema dark
suppressMessages(library(extrafont))       # Pacote para customizar a fonte nos plots

library(showtext)
library(showtextdb)

font_add(
  here::here("assets", "fonts", "Helvetica.ttf"),
  here::here("assets", "fonts", "helvetica-light.ttf"),
  here::here("assets", "fonts", "Helvetica-Bold.ttf"),
)

showtext_auto()

# funcao para importar a fonte
#font_import("./")
#y
# ao importar, o sistema pedira 
# que confirme a importacao
# rode essa letra "y" para confirmar

# carregar as fontes para customizacao
loadfonts(device = "win")


# ------

# Define liberum_theme() function

theme_hcostax <- function(){
  
  font <- "Helvetica"            # assign font family up front
  font_light <- "Helvetica Light"
  
#  dark_theme_minimal() %+replace%    # replace elements we want to change
  
  theme(
    
    #grid elements
    # panel.grid.major = element_blank(),    # strip major gridlines
    # panel.grid.minor = element_blank(),    # strip minor gridlines
    # axis.ticks = element_blank(),          # strip axis ticks
    # 
    # since theme_minimal() already strips axis lines, 
    # we don't need to do that again
    
    # text elements
    plot.title = element_text(             # title
      family = font,            # set font family
      size = 20,                # set font size
      face = 'bold',            # bold typeface
      color = "#525252",        # set font color
      hjust = 0,                # left align*
      vjust = 2),               # raise slightly*
    
    # *The value of hjust and vjust are only defined between 0 and 1:
    # 0 means left-justified
    # 1 means right-justified
    # 0.5 means middle-justified
    
    plot.subtitle = element_text(          # subtitle
      family = font_light,                 # font family
      color="#525252",                     # set font color
      size = 12,
      hjust = 0,                           # left align*
      vjust = 2),                          # font size
    
    plot.caption = element_text(           # caption
      family = font_light,                 # font family
      size = 9,                            # font size
      face = "italic",                     # italic typeface
      colour = "#b3b3b3",                  # set font color
      hjust = 1),                          # right align
    
    axis.title = element_text(             # axis titles
      family = font_light,                       # font family
      face = 'bold',                       # bold typeface
      color = "#5f5f5f",                   # set font color
      size = 10),                          # font size
    
    axis.text = element_text(              # axis text
      family = font_light,                       # axis family
      color = "#5f5f5f",                   # set font color
      size = 9),                           # font size
    
    axis.text.x = element_text(            # margin for axis text
      color = "#5f5f5f",                   # set font color
      margin=margin(5, b = 10)),
    
    axis.text.y = element_text(            # margin for axis text
      color = "#5f5f5f",                   # set font color
      margin=margin(10, b = 20)),
    
    #legend.position="bottom",              # set the legend position
    
    legend.title = element_text(
      colour="#5f5f5f",                    # set legend text color
      size = 12,
      family = font                        # font family
      
    ),        # set NULL legend tittle
    
    legend.key.size = unit(0.5, "cm"),
    
    legend.text = element_text(
      colour="#5f5f5f",                    # set legend text color
      size = 12,
      family = font                        # font family
      
    )
    
    
    # since the legend often requires manual tweaking 
    # based on plot content, don't define it here
  )
}
