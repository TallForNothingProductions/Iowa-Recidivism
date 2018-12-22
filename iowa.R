library(descr)
iowa <- read.csv(file.choose())
iowa <- iowa[which(iowa$Race == "White" | iowa$Race == "Black"),]
iowa <- iowa[iowa$Release.Type != "",]
iowa <- iowa[iowa$Release.Type != "Other",]
crosstab(iowa$Age.At.Release, iowa$Race, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Recidivism, iowa$Sex, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Release.Type, iowa$Sex, , prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Offense.Class, iowa$Race, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Offense.Type, iowa$Race, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Recidivism, iowa$Race, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Release.Type, iowa$Race, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Recidivism, iowa$Release.Type, prop.c = TRUE, chisq = TRUE)

summary(glm(Recidivism ~ Age.At.Release + Offense.Class + Offense.Type + Release.Type + Race + Sex, data = iowa, family = "binomial"))

iowa$Release.Type <- factor(iowa$Release.Type, levels = c("Discharged","Parole"))
summary(glm(Release.Type ~ Age.At.Release + Offense.Class + Offense.Type + Race + Sex, data = iowa, family = "binomial"))

crosstab(iowa$Release.Type, iowa$Offense.Type, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Recidivism, iowa$Offense.Type, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Sex, iowa$Race, prop.c = TRUE, chisq = TRUE)
crosstab(iowa$Offense.Class, iowa$Race)
crosstab(iowa$Recidivism, iowa$Offense.Class)
crosstab(iowa$Release.Type, iowa$Offense.Class)