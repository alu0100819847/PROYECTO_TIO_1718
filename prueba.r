library(tm)
library(SnowballC)
library(wordcloud)
library(ggplot2)
library(dplyr)
library(readr)
library(cluster)
library(tidyverse)
library(lsa)


ficheros <- file.path("~", "Desktop", "4","TIO","PROYECTO_TIO_1718","corpus")
ficheros <- iconv(ficheros)
corp <- Corpus(DirSource(ficheros))
d<- tm_map(corp, content_transformer(tolower))
d<- tm_map(d, stripWhitespace)
d<- tm_map(d, removePunctuation)
d<- tm_map(d, removeNumbers)
d<- tm_map(d, removeWords, stopwords("spanish"))
sw <- readLines("/Users/nestor/Desktop/4/TIO/PROYECTO_TIO_1718/stopword.es")
d <- tm_map(d, removeWords, sw)
corp <- d %>% VectorSource() %>% Corpus()
nube <- tm_map(d, PlainTextDocument)
wordcloud(nube, max.words = 80, random.order = F, colors = brewer.pal(name = "Dark2", n = 8))
tdm_nuevo <- TermDocumentMatrix(corp)
matriz <- as.matrix(tdm_nuevo)
dim(matriz)
matriz <- matriz %>% rowSums() %>% sort(decreasing = TRUE)
matriz <- data.frame(palabra = names(matriz), frec = matriz)

matriz[1:10, ] %>%
  ggplot(aes(palabra, frec)) +
  geom_bar(stat = "identity", color = "black", fill = "#87CEFA") +
  geom_text(aes(hjust = 1.3, label = frec)) + 
  coord_flip() + 
  labs(title = "Diez palabras más frecuentes en el corpus",  x = "Palabras", y = "Número de usos")


matriz %>%
  mutate(perc = (frec/sum(frec))*100) %>%
  .[1:10, ] %>%
  ggplot(aes(palabra, perc)) +
  geom_bar(stat = "identity", color = "black", fill = "#87CEFA") +
  geom_text(aes(hjust = 1.3, label = round(perc, 2))) + 
  coord_flip() +
  labs(title = "Diez palabras más frecuentes en el corpus", x = "Palabras", y = "Porcentaje de uso")


matriz[1:5, ] %>%
  ggplot(aes(palabra, frec, size=frec)) +
  geom_point(alpha=0.4) +
  scale_size_continuous( trans="exp", range=c(1, 25)) +
  scale_colour_continuous(guide = FALSE)


#LSA
tdm <- TermDocumentMatrix(d)
m = as.matrix(tdm)
tdms <- removeSparseTerms(tdm, 0.1)
espacio_lsa = lsa(tdms, dims=dimcalc_raw())
matriz <- round(as.textmatrix(espacio_lsa),2)
#Comparar similitud mediante el coseno
similitud = cosine(matriz)
cor(matriz, method = "spearman")

