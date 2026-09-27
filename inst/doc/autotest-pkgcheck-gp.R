## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set (
    collapse = TRUE
)

## ----check-groups-fn, eval = FALSE--------------------------------------------
# goodpractice::describe_check_groups ()

## ----check-groups-formatted, echo = FALSE, eval = TRUE, results = "asis"------
g <- goodpractice::describe_check_groups ()
for (i in seq_along (g)) {
    out <- paste0 ("**", names (g) [i], "**: ", g [[i]], "\n\n")
    cat (out)
}

