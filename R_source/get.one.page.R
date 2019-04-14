
## #######################################################
##  bý til fall til að sækja hverja síðu fyrir sig.
##  skila bara hlutnum í .vehicleinfo css tagginu
## #######################################################
get.one.page <- function(vID){
  # vID <- 'RS333'
  url <- paste('https://www.samgongustofa.is/umferd/okutaeki/okutaekjaskra/uppfletting?vq=',
               vID, sep = '')
  
  #url <- 'https://www.samgongustofa.is/umferd/okutaeki/okutaekjaskra/uppfletting?vq=LB771'
  
  out <- tryCatch(
    {
      # Just to highlight: if you want to use more than one 
      # R expression in the "try" part then you'll have to 
      # use curly brackets.
      # 'tryCatch()' will return the last evaluated expression 
      # in case the "try" part was completed successfully
      
      message("This is the 'try' part")
      
      page <- read_html(url)
      return(extract.vehicle.info(page))
      
      },
    error=function(cond) {
      message(paste("URL does not seem to exist:", url))
      message("Here's the original error message:")
      message(cond)
      # Choose a return value in case of error
      return(NA)
    },
    warning=function(cond) {
      message(paste("URL caused a warning:", url))
      message("Here's the original warning message:")
      message(cond)
      # Choose a return value in case of warning
      return(NULL)
    },
    finally={
      # NOTE:
      # Here goes everything that should be executed at the end,
      # regardless of success or error.
      # If you want more than one expression to be executed, then you 
      # need to wrap them in curly brackets ({...}); otherwise you could
      # just have written 'finally=<expression>' 
      message(paste("Processed URL:", url))
    }
  )    
  return(out)
}
