# C218 KISHAN SINGH
# import the data from excel
data <- read.csv('C218_KISHAN_MANOVA_DATASET.csv')

# Print the data
data

#Univariate description of the data
par(mfrow=c(1,3))
boxplot(data$Height ~ data$Treatment)
boxplot(data$Width ~ data$Treatment)
boxplot(data$Weight ~ data$Treatment)

#Multivariate description of the data
# correlations
cor(data[,c('Height', 'Width', 'Weight')])

par(mfrow=c(1,3))
plot(data$Height, data$Weight, pch=data$Treatment)
plot(data$Width, data$Weight, pch=data$Treatment)
plot(data$Height, data$Width, pch=data$Treatment)

#Fitting the MANOVA in R
data$Treatment <- factor(data$Treatment)

manova_result <- manova(cbind(Weight, Height, Width) ~ Treatment, data = data)
summary(manova_result)

