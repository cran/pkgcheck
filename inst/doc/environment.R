## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set (
    collapse = TRUE,
    warning = TRUE,
    message = TRUE,
    width = 120,
    comment = "#>",
    fig.retina = 2,
    fig.path = "README-"
)
options (repos = c (
    ropenscireviewtools = "https://ropensci-review-tools.r-universe.dev",
    CRAN = "https://cloud.r-project.org"
))
library (pkgcheck)

