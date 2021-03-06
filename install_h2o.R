# http://h2o-release.s3.amazonaws.com/h2o/rel-yau/10/index.html

# The following two commands remove any previously installed H2O packages for R.
if ("package:h2o" %in% search()) { detach("package:h2o", unload=TRUE) }
if ("h2o" %in% rownames(installed.packages())) { remove.packages("h2o") }

# Next, we download packages that H2O depends on.
pkgs <- c("RCurl","jsonlite")
for (pkg in pkgs) {
  if (! (pkg %in% rownames(installed.packages()))) { install.packages(pkg) }
}

# Now we download, install and initialize the H2O package for R.
install.packages("h2o", type="source", 
                 repos="http://h2o-release.s3.amazonaws.com/h2o/rel-yau/10/R")

# Finally, let's load H2O and start up an H2O cluster
library(h2o)
h2o.init()


####
detach("package:rsparkling", unload = TRUE)
if ("package:h2o" %in% search()) { detach("package:h2o", unload = TRUE) }
if (isNamespaceLoaded("h2o")){ unloadNamespace("h2o") }
remove.packages("h2o")
install.packages("h2o", type = "source", 
                 repos = "https://h2o-release.s3.amazonaws.com/h2o/rel-weierstrass/2/R")