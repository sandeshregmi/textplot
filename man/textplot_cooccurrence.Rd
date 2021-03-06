% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/textplot_cooccurrence.R
\name{textplot_cooccurrence}
\alias{textplot_cooccurrence}
\alias{textplot_cooccurrence.default}
\title{Plot term cooccurrences as a network}
\usage{
textplot_cooccurrence(x, ...)

\method{textplot_cooccurrence}{default}(
  x,
  terms,
  top_n = 50,
  title = "Term cooccurrences",
  subtitle = list(),
  vertex_color = "darkgreen",
  edge_color = "grey",
  base_family = "",
  ...
)
}
\arguments{
\item{x}{a data.frame with columns term1, term2 and cooc indicating how many times 2 terms are occurring together}

\item{...}{other parameters passed on to \code{ggraph::geom_node_text}}

\item{terms}{a character vector with terms to only plot. Prevails compared to using \code{top_n}}

\item{top_n}{integer indicating to show only the top n occurrences as in \code{head(x, n = top_n)}}

\item{title}{character string with the title to use in the plot}

\item{subtitle}{character string with the subtitle to use in the plot}

\item{vertex_color}{character with the color of the label of each node. Defaults to darkgreen.}

\item{edge_color}{character with the color of the edges between the nodes. Defaults to grey.}

\item{base_family}{character passed on to \code{theme_void} setting the base font family}
}
\value{
an object of class ggplot
}
\description{
Plot term cooccurrences in a graph structure
}
\examples{
library(udpipe)
library(igraph)
library(ggraph)
data(brussels_reviews_anno, package = 'udpipe')
x <- subset(brussels_reviews_anno, xpos \%in\% "JJ" & language \%in\% "fr")
x <- cooccurrence(x, group = "doc_id", term = "lemma")

textplot_cooccurrence(x, top_n = 25, subtitle = "showing only top 25")
textplot_cooccurrence(x, top_n = 25, title = "Adjectives",
                      vertex_color = "orange", edge_color = "black",
                      fontface = "bold")
}
