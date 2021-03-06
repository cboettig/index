% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prov.R
\name{write_prov}
\alias{write_prov}
\title{Write a provenance trace into JSON-LD using DCAT2 & PROV vocabularies}
\usage{
write_prov(
  data_in = NULL,
  code = NULL,
  data_out = NULL,
  meta = NULL,
  creator = NULL,
  title = NULL,
  description = NULL,
  issued = as.character(Sys.Date()),
  license = "https://creativecommons.org/publicdomain/zero/1.0/legalcode",
  provdb = "prov.json",
  append = TRUE
)
}
\arguments{
\item{data_in}{path or URI for input data}

\item{code}{path or URI for code}

\item{data_out}{path or URI to output data}

\item{meta}{path or URI to metadata describing the workflow}

\item{creator}{URI, list node, or text for creator}

\item{title}{Dataset title, character string}

\item{description}{Dataset description, character string}

\item{issued}{publication date, as Date or character object}

\item{license}{URL to a copyright license}

\item{provdb}{path to output JSON file, default "prov.json"}

\item{append}{Should we append to existing json or overwrite it?}
}
\description{
Write a provenance trace into JSON-LD using DCAT2 & PROV vocabularies
}
\examples{
 
## Use temp files for illustration only
provdb <- tempfile(fileext = ".json")
input_data <- tempfile(fileext = ".csv")
output_data <- tempfile(fileext = ".csv")
code <- tempfile(fileext = ".R")

## A minimal workflow: 
write.csv(mtcars, input_data)
out <- lm(mpg ~ disp, data = mtcars)
write.csv(out$coefficients, output_data)

# really this would already exist...
writeLines("out <- lm(mpg ~ disp, data = mtcars)", code)

## And here we go: 
write_prov(input_data, code, output_data, provdb = provdb,  
           append= FALSE)
 
## Include a title to group these into a Dataset:
write_prov(input_data, code, output_data, provdb = provdb,
           title = "example dataset with provenance",  append= FALSE)
           
}
