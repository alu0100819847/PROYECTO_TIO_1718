library(tm)
library(lsa)
library(SnowballC)

#Carga de ficheros
ficheros <- file.path("~", "Desktop", "PROYECTO_TIO_1718","corpus")

#Transformaciones a formatos compatibles con metodos de paquetes para el PLN
ficheros <- iconv(ficheros, to ="utf-8")

#Creacion de corpus
corp <- Corpus(DirSource(ficheros))


#Transformaciones
d<- tm_map(corp, content_transformer(tolower))
d<- tm_map(d, stripWhitespace)
d<- tm_map(d, removePunctuation)
d<- tm_map(d, removeNumbers)
d<- tm_map(d, removeWords, stopwords("spanish"))
sw <- readLines("/Users/nestor/Desktop/PROYECTO_TIO_1718/stopword.es")
d <- tm_map(d, removeWords, sw)




#Matriz de terminos-documentos
tdm <- TermDocumentMatrix(d)
m = as.matrix(tdm)


#LSA
tdms <- removeSparseTerms(tdm, 0.1)
espacio_lsa = lsa(tdms, dims=dimcalc_raw())
matriz <- round(as.textmatrix(espacio_lsa),2)






#Comparar similitud mediante el coseno
similitud = cosine(matriz)

#Spearman
cor(matriz, method = "spearman")
