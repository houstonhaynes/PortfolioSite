library(RSelenium)

rD1 <- rsDriver(browser = "firefox", port = 4545L, geckover = NULL, 
                chromever =  "latest", iedrver = NULL, 
                phantomver = NULL)
remDr1 <- rD1[["client"]] 
