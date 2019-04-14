sameina.dput <- function(path = './_GognUt/', pattern = '\\.dput'){
  
  dput.files <- list.files(path =path, pattern = pattern, full.names = TRUE)
  d.stack <- lapply(dput.files, dget)
  
  # keyri rbind inn á innsta lagið, síðan á ytra lagið
  d.stack <- lapply(d.stack, function(x) do.call(rbind, x))
  d.stack <- do.call(rbind, d.stack)
  
  # d.stack er matrixa, þarf að breyta í data.frame
  d.stack <- as.data.frame(d.stack)
  # lagfæri dálkanöfnin
  names(d.stack) <- tolower(names(d.stack)) %>% 
    str_replace(':', '') %>% 
    str_replace('\\s+', '_')
  
  d.stack <- d.stack %>% as_tibble()
  
  class(d.stack) <- c(class(d.stac), 'Samgöngustofa-töflur.raw')
  return(d.stack)
}
