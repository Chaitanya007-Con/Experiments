
## Part I: Data cleaning 



#Import the follwoing packages.
#tm is a text mining package that is used to remove punctuations, numbers and whitespaces.
#stopwords is a package that contains multilingual stopword list. 
#stringi package contains multiple string processing methods.
library(tm)
library(stopwords)
library(stringi)


getwd()
#get the file and load it in a variable
textHindi <- readLines(con <- file("HindiStory.txt", encoding = "UTF-8")) 

#close the connection since texts are already stored in a variable.
close(con)


unique(Encoding(textHindi))

#removePunctuation() is used to remove Punctuations from the text since they aren't required.
textHindi <- removePunctuation(textHindi)

#removeNumbers() is used to remove Numbers from the text since they aren't required.

textHindi <- removeNumbers(textHindi)

#removing the unwanted whitespaces
textHindi <- stripWhitespace(textHindi)


## Part II: Staging with pretrained language model

#Udpipe is used for Tokenization (1), Parts of Speech tagging (2), Lemmatization (3) and Dependency Parsing (4).
library(udpipe)

#UTF-8 is used because it is the standard and supports most of the language
library(utf8)

#Downloads udpipe hindi model.
udmodel <- udpipe_download_model(language = "hindi")

udmodel_hindi <- udpipe_load_model(udmodel$file_model)

#udpipe_annotate() takes language model (udmodel_hindi) 
#and annotates the given text data (hindi)
#Assigning the text to a data frame.
x <- data.frame(udpipe_annotate(udmodel_hindi, x = textHindi ))


#Print the dataframe tokenwise.
utf8_print(unlist(x$token))
#Display the parts of speech in the text.
x$upos

## Part III: Analysis

## Use lattice package to plot text of speech.
library(lattice)
stats <- txt_freq(x$upos)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = stats, col = "springgreen3", 
         main = "UPOS (Universal Parts of Speech)\n frequency of occurrence", 
         xlab = "Freq")

## Plot the most common Nouns.
stats <- subset(x, upos %in% c("NOUN")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 30), col = "coral4", 
         main = "Most occurring nouns", xlab = "Freq")

## Display most common Adjectives.

stats <- subset(x, upos %in% c("ADJ")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 30), col = "tan3", 
         main = "Most occurring adjectives", xlab = "Freq")

## Most occuring Verbs.
stats <- subset(x, upos %in% c("VERB")) 
stats <- txt_freq(stats$token)
stats$key <- factor(stats$key, levels = rev(stats$key))
barchart(key ~ freq, data = head(stats, 30), col = "slategrey", 
         main = "Most occurring Verbs", xlab = "Freq")


## Group verbs & nouns.

stats <- keywords_rake(x = x, term = "lemma", group = "doc_id", 
                       relevant = x$upos %in% c("NOUN","VERB"))
stats$key <- factor(stats$keyword, levels = rev(stats$keyword))
barchart(key ~ rake, data = head(subset(stats, freq > 1), 80), col = "royalblue2", 
         main = "Keywords identified by Krishna", 
         xlab = "Krishna")


## Plot the WordCloud, which is the random arrangement of words.
library(wordcloud)
wordcloud(words = stats$key, freq = stats$freq, min.freq = 1, max.words = 400,
          random.order = FALSE, colors = brewer.pal(7, "Dark2"))
