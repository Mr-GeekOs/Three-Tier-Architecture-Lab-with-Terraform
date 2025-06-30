terraform { 
  cloud { 
    
    organization = "MrGeekOs" 

    workspaces { 
      name = "3tier-arch" 
    } 
  } 
}