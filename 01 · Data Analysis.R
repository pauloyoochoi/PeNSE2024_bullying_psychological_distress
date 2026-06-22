library(readxl)
library(lavaan)
library(semTools)
library(tidyverse)
library(psych)

df <- read_xlsx("pense_2024_clean.xlsx", na = c("null", ""))

describe(df)
colSums(is.na(df))
colMeans(is.na(df)) * 100

sem_model <- "
bullying =~ bully_verbal + bully_relational + bully_physical
psychological_distress =~ mh_worry + mh_sadness + mh_uncared + mh_irritable + mh_worthless

psychological_distress ~ bullying
"

fit_sem <- sem(sem_model, data = df, ordered = T, estimator= "wlsmv")
summary(fit_sem, fit.measures= T, standardized=T, rsquare=T)

# Moderator 1: School support 

fit_conf <- sem(sem_model, data = df, ordered = TRUE, estimator = "WLSMV",
                group = "support")

fit_metric <- update(fit_conf, group.equal = "loadings")

fit_scalar <- update(fit_conf, group.equal = c("loadings", "thresholds"))

fit_var    <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances"))

fit_covar  <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances", "lv.covariances"))

teste <- compareFit(fit_conf, fit_metric, fit_scalar, fit_var, fit_covar)
summary(teste)

fit_regression <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                                   "lv.variances", "lv.covariances",
                                                   "regressions"))

teste_moderation <- compareFit(fit_covar, fit_regression)
summary(teste_moderation)

subset(standardizedsolution(fit_covar), op == "~")

table(df$support)
lavInspect(fit_conf, "group.label")

# Moderator 2: Parental understanding 

fit_conf <- sem(sem_model, data = df, ordered = TRUE, estimator = "WLSMV",
                group = "parent_understanding")

fit_metric <- update(fit_conf, group.equal = "loadings")

fit_scalar <- update(fit_conf, group.equal = c("loadings", "thresholds"))

fit_var    <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances"))

fit_covar  <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances", "lv.covariances"))

teste <- compareFit(fit_conf, fit_metric, fit_scalar, fit_var, fit_covar)
summary(teste)

fit_regression <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                                   "lv.variances", "lv.covariances",
                                                   "regressions"))

teste_moderation <- compareFit(fit_covar, fit_regression)
summary(teste_moderation)

subset(standardizedsolution(fit_covar), op == "~")

table(df$parent_understanding)
lavInspect(fit_conf, "group.label")

# Moderator 3: Peer kindness
fit_conf <- sem(sem_model, data = df, ordered = TRUE, estimator = "WLSMV",
                group = "peer_kindness")

fit_metric <- update(fit_conf, group.equal = "loadings")

fit_scalar <- update(fit_conf, group.equal = c("loadings", "thresholds"))

fit_var    <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances"))

fit_covar  <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances", "lv.covariances"))

teste <- compareFit(fit_conf, fit_metric, fit_scalar, fit_var, fit_covar)
summary(teste)

fit_regression <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                                   "lv.variances", "lv.covariances",
                                                   "regressions"))

teste_moderation <- compareFit(fit_covar, fit_regression)
summary(teste_moderation)

subset(standardizedsolution(fit_covar), op == "~")

table(df$peer_kindness)
lavInspect(fit_conf, "group.label")

# Moderator 4: Number of close friends
fit_conf <- sem(sem_model, data = df, ordered = TRUE, estimator = "WLSMV",
                group = "n_friends")

fit_metric <- update(fit_conf, group.equal = "loadings")

fit_scalar <- update(fit_conf, group.equal = c("loadings", "thresholds"))

fit_var    <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances"))

fit_covar  <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                               "lv.variances", "lv.covariances"))

teste <- compareFit(fit_conf, fit_metric, fit_scalar, fit_var, fit_covar)
summary(teste)

fit_regression <- update(fit_conf, group.equal = c("loadings", "thresholds",
                                                   "lv.variances", "lv.covariances",
                                                   "regressions"))

teste_moderation <- compareFit(fit_covar, fit_regression)
summary(teste_moderation)

subset(standardizedsolution(fit_covar), op == "~")

table(df$n_friends)
lavInspect(fit_conf, "group.label")
