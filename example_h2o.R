#### WITH H2O
options(rsparkling.sparklingwater.version = "2.1.14")

library(rsparkling)
library(sparklyr)
library(dplyr)
library(h2o)

sc <- spark_connect(master = "local", version = "2.1.0")
mtcars_tbl <- copy_to(sc, mtcars, "mtcars")

mtcars_h2o <- as_h2o_frame(sc, mtcars_tbl, strict_version_check = FALSE)

mtcars_glm <- h2o.glm(x = c("wt", "cyl"), 
                      y = "mpg",
                      training_frame = mtcars_h2o,
                      lambda_search = TRUE)
mtcars_glm
