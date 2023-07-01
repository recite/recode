.onAttach <- function(libname, pkgname) {
  packageStartupMessage("\nPlease cite as:\n")
  citationInfo <- citation("stargazer")
  
  packageStartupMessage(paste(citationInfo$title))
  packageStartupMessage(paste(citationInfo$author))
  packageStartupMessage(paste(citationInfo$year))
  packageStartupMessage(paste(citationInfo$note))
  packageStartupMessage(paste(citationInfo$url))
}
