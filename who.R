

anthro_zscores_518 <- function(db, path = paste0(getwd(), "/who2007_r/"), save.to = "temp", 
                               sex="Sex", age_mo="Age", weight_kg="Weight", height_cm="Height") {
  
  # print (path)
  # print(path %+% "wfawho2007.txt")
  wfawho2007<-read.delim(path %+% "wfawho2007.txt")
  hfawho2007<-read.delim(path %+% "hfawho2007.txt")
  bfawho2007<-read.delim(path %+% "bfawho2007.txt")
  
  # survey.who2007<-read.csv(path %+% "survey_who2007.csv", header=T, sep=",", skip=0, na.strings="")
  
  source(path %+% "who2007.r")
  
  cn <- colnames(db)
  cn[cn==sex] <- "sex"
  cn[cn==age_mo] <- "age_mo"
  cn[cn==weight_kg] <- "weight_kg"
  cn[cn==height_cm] <- "height_cm"
  colnames(db) <- cn
  db$sex = as.character(db$sex)
  
  who2007(#FileLab = "survey_who2007", 
          FilePath = path, 
          mydf = db,
          sex = "sex", age = "age_mo", weight = "weight_kg", height = "height_cm")
}
