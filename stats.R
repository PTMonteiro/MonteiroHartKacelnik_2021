# Load DATA
prefNatural <- read.csv('preferenceNatural.csv',header=TRUE)
prefArtificial <- read.csv('preferenceArtificial.csv',header=TRUE)

# add lables to different sound types used in imprinting exposure
prefNatural$V5 <- 1
prefArtificial$V5 <- 2
colnames(prefNatural)<-c('preference','silentGapDuration','test','testDifficulty', 'preSoundType')
colnames(prefArtificial)<-c('preference','silentGapDuration','test','testDifficulty', 'preSoundType')

prefALL <-  rbind(prefNatural,prefArtificial)
prefALL$silentGapDuration<-factor(prefALL$silentGapDuration,ordered = FALSE)
prefALL$test<-factor(prefALL$test,ordered = FALSE)
prefALL$testDifficulty<-factor(prefALL$testDifficulty,ordered = FALSE)
prefALL$preSoundType<-factor(prefALL$preSoundType,ordered = FALSE)


# Model
modelprefALL= aov(preference~preSoundType*testDifficulty+preSoundType*silentGapDuration+ testDifficulty*silentGapDuration,data=prefALL)
summary(modelprefALL)

# interaction plot
cat_plot(modelprefALL, pred = testDifficulty, modx = preSoundType, modx.labels=c("natural", "artificial"),
         pred.point.size = 5,
         line.thickness = 0.5,
         errorbar.width = 0.5)