## einfalt extract fall sem sækir upplýsingar af síðunum
extract.vehicle.info <- function(page){
  
  t.tag <- page %>% 
    html_node(xpath = '/html/body/div[2]/div/div[2]/div/ul') %>%
    html_nodes("strong")%>%
    html_text()
  
  t.val <- page %>% 
    html_node(xpath = '/html/body/div[2]/div/div[2]/div/ul') %>%
    html_nodes("span")%>%
    html_text()
  
  names(t.val) <- t.tag
  
  return(t.val)
}