hreinsa.ramma <- function(d.raw){
  
  if(!('Samgöngustofa-töflur.raw' %in% class(d.raw))){
    stop('Hér þarf að athuga hvort að d.raw sé af réttri tegund. Dálkanöfn geta verið röng.')
  }
  
  d <- d.raw %>% 
    # losa mig við faktora
    mutate(tegund = as.character(tegund),
           skráningarnr = as.character(skráningarnr),
           fastanr = as.character(fastanr),
           verksmiðjunr = as.character(verksmiðjunr),
           fyrst_skráð = as.character(fyrst_skráð) %>%
             # þetta er dagsetning
             dmy(),
           co2_losun = as.character(co2_losun) %>%
             str_replace('.g/km', '') %>%
             # þetta ætti að vera gildi
             as.numeric(),
           eiginþyngd = as.character(eiginþyngd) %>%
             str_replace(' kg', '') %>%
             # þetta ætti að vera gildi
             as.numeric(),
           staða = as.character(staða),
           næsta_skoðun = as.character(næsta_skoðun) %>%
             # þetta er dagsetning
             dmy()
    ) %>%
    filter(!is.na(tegund)) %>%
    rename(skraningarnr = skráningarnr,
           verksmidjunr = verksmiðjunr, 
           fyrst_skrad = fyrst_skráð,
           eiginthyngd = eiginþyngd,
           stada = staða,
           naesta_skodun = næsta_skoðun)
  
  # ##########################################################
  #  Næst skipti ég tegund dálkinum í make/model
  #  hreinsa upp nokkrar villur
  
  d$tegund[str_which(d$tegund, 'P - H -  ')] <- 'P-H - UNK'
  d$tegund[str_which(d$tegund, 'SNOW - TRAC - ')] <- 'SNOW-TRAC - UNK'
  d$tegund[str_which(d$tegund, 'CHRYSLER - TOWN - COUNTRY')] <- 'CHRYSLER - TOWN AND COUNTRY'
  d$tegund[str_which(d$tegund, 'O - K - TH30')] <- 'O-K - TH30'
  
  # skipti dálknum up
  d <- d %>% 
    mutate(tegund = tegund %>%
             str_replace(' \\(.*\\)', '')) %>% 
    separate(col = tegund, into = c('make', 'model'), sep = ' - ')
  
  class(d) <- c(class(d), 'Samgöngustofa-tafla.clean')
  return(d.stack)
}
