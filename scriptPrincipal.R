#Proyecto final del módulo de R. 
setwd("/home/matahj/z_crsr/0beduDtSc/r/proyectoFinalModuloR")

datos <- read.csv("match.data.csv")
datos

s <- renderDataTable(iris, 
                     options = list(
                       pageLength = 5,
                       initComplete = I("function(settings, json) {alert('Done.');}")
s

datos








