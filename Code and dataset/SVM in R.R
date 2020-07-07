str(Dataset_infy)
summary(Dataset_infy)

dataset= Dataset_infy[4:6]
str(dataset)

is.na(dataset)
install.packages("e1071")

library(e1071)
regressor= svm(formula= High.Price ~ Open.Price + Prev.Close, data = dataset, type = "eps-regression", kernel= "radial")

y_predicted = predict(regressor,data.frame(Open.Price=700, Prev.Close =650))
print(y_predicted)

install.packages("ggplot2")
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Open.Price, y = dataset$High.Price), colour = 'red') +
  geom_line(aes(x = dataset$Open.Price, y = predict(regressor, newdata = dataset)),colour = 'blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Prev Close') +
  ylab('High')

