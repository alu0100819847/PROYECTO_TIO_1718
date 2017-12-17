library(tm)
library(wordcloud)
library(SnowballC)
library(ggplot2)

ficheros <- file.path("~", "Desktop", "4","TIO","PROYECTO_TIO_1718","corpus")
ficheros <- iconv(ficheros, to ="utf-8")
corpus <- Corpus(DirSource(ficheros))
d<- tm_map(corpus, tolower)
d<- tm_map(d, stripWhitespace)
d<- tm_map(d, removePunctuation)
d<- tm_map(d, removeNumbers)
d<- tm_map(d, removeWords, stopwords("spanish"))
d <- tm_map(d, stemDocument)
sw <- readLines("/Users/nestor/Desktop/4/TIO/PROYECTO_TIO_1718/stopword.es",encoding="UTF-8")
sw = iconv(sw, to="ASCII//TRANSLIT")
d <- tm_map(d, removeWords, sw)
tdm <- TermDocumentMatrix(d)
m = as.matrix(tdm)
wf <- sort(rowSums(m),decreasing=TRUE)
dm <- data.frame(word = names(wf), freq=wf)
findFreqTerms(tdm, lowfreq=20)
wordcloud(dm$word, dm$freq,random.order=FALSE, colors=brewer.pal(8,"Dark2"))




