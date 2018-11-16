library(hexSticker)
library(RColorBrewer)
img <- "Pictures/Picture2.png"
sysfonts::font_add("Logo_font",regular = "/Library/Fonts/Lao MN.ttc")
sticker(subplot = img, s_x=1, s_y=.88,s_height = 0.1,s_width=.87,package="EcoDataSci-TLV",p_color = "black",url = "https://github.com/ecodatasci-tlv",u_color = "#525252",u_family = "Logo_font",dpi = 300,u_size = 1.5, p_family = "Logo_font", h_color = "black",h_fill = "#7fcdbb",p_size=5, 
        filename="Pictures//EcoDataSci_logo.png")

