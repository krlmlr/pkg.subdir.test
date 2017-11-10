<!-- README.md is generated from README.Rmd. Please edit that file -->
pkg.subdir.test
===============

Placing source files for R packages in subdirectories of `R/`.

Directory structure
-------------------

``` r
dir(".", recursive = TRUE)
#> [1] "DESCRIPTION"           "NAMESPACE"             "pkg.subdir.test.Rproj"
#> [4] "R/0.R"                 "R/a/1.R"               "R/b/2.R"              
#> [7] "R/zzz.R"               "README.knit.md"        "README.Rmd"
```

Code to load files from subdirectories
--------------------------------------

``` r
cat(readLines("R/zzz.R"), sep = "\n")
#> dummy <- function() {}
#> 
#> first_level_files <- dir("R", full.names = TRUE)
#> dirs <- first_level_files[file.info(first_level_files)$isdir]
#> source_files <- dir(first_level_files, recursive = TRUE, full.names = TRUE)
#> 
#> for (file in source_files) sys.source(file, environment(dummy))
```

Result
------

``` r
devtools::load_all()
#> Loading pkg.subdir.test
f
#> function(x) "defined in 0.R"
#> <environment: namespace:pkg.subdir.test>
a
#> function(x) "defined in 1.R"
#> <environment: namespace:pkg.subdir.test>
b
#> function(y) "defined in 2.R"
#> <environment: namespace:pkg.subdir.test>
```

-   Functions have the correct environment
-   roxygen2 directives are not (yet) picked up correctly
