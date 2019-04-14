
# process fall sem geymir gögnin á diski eftir ákveðin chunk
# þetta gæti verið svolítið aggresíft
# hver síða er sótt og geymd sem lista-item

fProc.list <- function(start, end){
  ts <- lapply(vIDs[start:end], get.one.page)
  dput(ts, paste('vIDs_', start, '_', end, '.dput', sep = ''))
  message('Geymdi skjalið: ', paste('vIDs_', start, '_', end, '.dput', sep = ''))
}


## önnur kurteisari aðferð, tekur 10 sinnum lengri tíma
fProc.w.delay <- function(start, end){
  
  len <- end-start
  ts <- list(len)
  
  for(i in seq(len)){
    start_time <- Sys.time()
    ts[[i]] <- onepage(vIDs[i])
    Sys.sleep((Sys.time() - start_time)*10)
  }
  
  dput(ts, paste('vIDs_', start, '_', end, '.dput', sep = ''))
  message('Geymdi skjalið: ', paste('vIDs_', start, '_', end, '.dput', sep = ''))
  
}