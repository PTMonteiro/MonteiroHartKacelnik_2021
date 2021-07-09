# import LIBRARIES
library(sjPlot)
library(sjmisc)
library(ggplot2)
library(interactions)

# Load DATA
prefNatural <- read.csv('preferenceNatural.csv',header=TRUE)
prefArtificial <- read.csv('preferenceArtificial.csv',header=TRUE)

# add labels to different sound types used in imprinting exposure
prefNatural$V5 <- 1
prefArtificial$V5 <- 2
colnames(prefNatural)<-c('preference','imprintSilentGapDuration','test','testCondition', 'imprintSoundType')
colnames(prefArtificial)<-c('preference','imprintSilentGapDuration','test','testCondition', 'imprintSoundType')

prefALL <-  rbind(prefNatural,prefArtificial)
prefALL$imprintSilentGapDuration<-factor(prefALL$imprintSilentGapDuration,ordered = FALSE)
prefALL$test<-factor(prefALL$test,ordered = FALSE)
prefALL$testCondition<-factor(prefALL$testCondition,ordered = FALSE)
prefALL$imprintSoundType<-factor(prefALL$imprintSoundType,ordered = FALSE)


# Model
modelprefALL= aov(preference~imprintSoundType*testCondition+imprintSoundType*imprintSilentGapDuration+ testCondition*imprintSilentGapDuration,data=prefALL)
summary(modelprefALL)

# interaction plot
cat_plot(modelprefALL, pred = testCondition, modx = imprintSoundType, modx.labels=c("duck sound", "white noise"),
         pred.point.size = 5,
         line.thickness = 0.5,
         errorbar.width = 0.5)