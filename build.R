## #################################################################################################
#  rm(list = ls())
## #################################################################################################

library(tidyverse)
library(lubridate)
library(rvest)

source('./R_source/__init__.R')
## sæki lista með öllum númerunum:


## ########################
##  söfnun á gögnum
## ########################

# sæki lista af fastanúmerum sem á að leita að
the_data <- readxl::read_excel('./shoppinglist.xlsx')
the_data <- the_data %>% as_tibble()
vIDs <- the_data$Fastanumer

# fProc.list(1, 10000)
# fProc.list(10001, 20000)
# fProc.list(30001, 40000)
# fProc.list(40001, 50000)
# fProc.list(50001, 60000)
# fProc.list(60001, 70000)
# fProc.list(70001, 80000)
# fProc.list(80001, 90000)
# fProc.list(90001, 100000)
# fProc.list(100001, 110000)
# fProc.list(110001, 120000)
# fProc.list(120001, 130000)
# fProc.list(130001, length(vIDs))

# hver keyrsla tók í kringum 1 klst og hvert output skjal er um 1.3 mb


# sameina töflurnar í einn bút
d.raw <- sameina.dput()

# ##################################################
# lagfæri faktora
#    lagfæri dagsetningar
#    breyti dálkum í tölur þar sem við á
#    lagfæri dálkanöfn

clean.data <- hreinsa.ramma(d.raw)

# geymi gögnin
write.csv2(clean.data, file = './_GognUt/scraped_data.csv', row.names = FALSE)


