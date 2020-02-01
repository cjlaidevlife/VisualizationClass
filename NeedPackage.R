packages <- c("tidyverse", "gganimate", "plotly", "openxlsx")
install_packages <- packages %in% rownames(install.packages())
if (any(install_packages == FALSE)){
  install.packages(packages[!install_packages])
}
libpackages = lapply(packages, library, character.only = TRUE)
invisible(libpackages)

# reference: https://github.com/AntoineSoetewey/statsandr.git