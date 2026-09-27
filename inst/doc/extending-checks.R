## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set (
    collapse = TRUE,
    width = 120,
    fig.retina = 2,
    fig.path = "README-"
)

## ----cache = FALSE, echo = FALSE----------------------------------------------
knitr::read_chunk ("../R/check-has-citation.R")
knitr::read_chunk ("../R/check-scrap.R")

## ----pkgchk-citation----------------------------------------------------------
#' Check whether a package has a `inst/CITATION` file.
#'
#' "CITATION" files are required for all rOpenSci packages, as documented [in
#' our "*Packaging
#' Guide*](https://devguide.ropensci.org/pkg_building.html#citation-file). This
#' does not check the contents of that file in any way.
#'
#' @param checks A 'pkgcheck' object with full \pkg{pkgstats} summary and
#' \pkg{goodpractice} results.
#' @noRd
pkgchk_has_citation <- function (checks) {

    "CITATION" %in% list.files (fs::path (checks$pkg$path, "inst"))
}

## ----output-pkgchk-scrap------------------------------------------------------
output_pkgchk_has_scrap <- function (checks) {

    out <- list (
        check_pass = length (checks$checks$has_scrap) == 0L,
        summary = "",
        print = ""
    )

    if (!out$check_pass) {
        out$summary <- "Package contains unexpected files."
        out$print <- list (
            msg_pre = paste0 (
                "Package contains the ",
                "following unexpected files:"
            ),
            obj = checks$checks$has_scrap,
            msg_post = character (0)
        )
    }

    return (out)
}

## ----scrap-out, echo = FALSE--------------------------------------------------
cli::cli_alert_danger ("Package contains the following unexpected files:")
cli::cli_ul ()
cli::cli_li (c ("a", "b"))
cli::cli_end ()

## ----pkgstats-check, eval = FALSE---------------------------------------------
# f <- system.file ("extdata", "pkgstats_9.9.tar.gz", package = "pkgstats")
# path <- pkgstats::extract_tarball (f)
# checks <- pkgcheck (path)
# summary (checks)

## ----pkgstats-check-out, echo = FALSE, eval = TRUE----------------------------
cli::cli_h1 ("pkgstats 9.9")
message ("")
s <- c (
    "- :heavy_check_mark: Package name is available",
    "- :heavy_multiplication_x: does not have a 'contributing' file.",
    "- :heavy_check_mark: uses 'roxygen2'.",
    "- :heavy_check_mark: 'DESCRIPTION' has a URL field.",
    "- :heavy_check_mark: 'DESCRIPTION' has a BugReports field.",
    "- :heavy_multiplication_x: Package has no HTML vignettes",
    "- :heavy_multiplication_x: These functions do not have examples: [pkgstats_from_archive].",
    "- :heavy_check_mark: Package has continuous integration checks.",
    "- :heavy_multiplication_x: Package coverage failed",
    "- :heavy_multiplication_x: R CMD check found 1 error.",
    "- :heavy_check_mark: R CMD check found no warnings."
)

for (i in s) {
    msg <- strsplit (i, "(mark|\\_x):\\s+") [[1]] [2]
    if (grepl ("heavy_check_mark", i)) {
        cli::cli_alert_success (msg)
    } else {
        cli::cli_alert_danger (msg)
    }
}

message ("")
cli::cli_alert_info ("Current status:")
cli::cli_alert_danger ("This package is not ready to be submitted.")

## ----check-aa-----------------------------------------------------------------
pkgchk_starts_with_aa <- function (checks) {
    checks$pkg$name
}

## -----------------------------------------------------------------------------
output_pkgchk_starts_with_aa <- function (checks) {

    out <- list (
        check_pass = grepl ("^aa",
            checks$checks$starts_with_aa,
            ignore.case = TRUE
        ),
        summary = "",
        print = ""
    )

    out$summary <- paste0 (
        "Package name [",
        checks$checks$starts_with_aa,
        "] does ",
        ifelse (out$check_pass,
            "",
            "NOT"
        ),
        " start with 'aa'"
    )

    return (out)
}

## ----pkgstats-check-out2, echo = FALSE, eval = TRUE---------------------------
cli::cli_h1 ("pkgstats 9.9")
message ("")
s <- c (
    "- :heavy_check_mark: Package name is available",
    "- :heavy_multiplication_x: does not have a 'contributing' file.",
    "- :heavy_check_mark: uses 'roxygen2'.",
    "- :heavy_check_mark: 'DESCRIPTION' has a URL field.",
    "- :heavy_check_mark: 'DESCRIPTION' has a BugReports field.",
    "- :heavy_multiplication_x: Package has no HTML vignettes",
    "- :heavy_multiplication_x: These functions do not have examples: [pkgstats_from_archive].",
    "- :heavy_check_mark: Package has continuous integration checks.",
    "- :heavy_multiplication_x: Package coverage failed",
    "- :heavy_multiplication_x: Package name [pkgstats] does NOT start with 'aa'",
    "- :heavy_multiplication_x: R CMD check found 1 error.",
    "- :heavy_check_mark: R CMD check found no warnings."
)

for (i in s) {
    msg <- strsplit (i, "(mark|\\_x):\\s+") [[1]] [2]
    if (grepl ("heavy_check_mark", i)) {
        cli::cli_alert_success (msg)
    } else {
        cli::cli_alert_danger (msg)
    }
}

message ("")
cli::cli_alert_info ("Current status:")
cli::cli_alert_danger ("This package is not ready to be submitted.")

## ----new-check-print, eval = FALSE--------------------------------------------
# print_check_screen (x, "<name-of-new-check>", pkg_env)

## ----eval = FALSE-------------------------------------------------------------
# out$check_type <- "pass_watch"

## ----eval = FALSE-------------------------------------------------------------
# out$check_type <- "none_watch"

## ----eval = FALSE-------------------------------------------------------------
# out$check_type <- "watch_none"

## ----test-structure, eval = FALSE---------------------------------------------
# checks <- make_check_data ()
# ci_out <- output_pkgchk_my_fn (checks)

## ----test-scrap-modify, eval = FALSE------------------------------------------
# checks$checks$has_scrap <- "scrap"

