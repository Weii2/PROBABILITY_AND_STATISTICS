data=[72.9, 31.9, 26.5, 29.1, 27.3, 8.6, 22.3, 26.5, 20.4, 12.8, 25.1, 19.2, 24.1, 58.2, 68.1, 89.2, 55.1, ...
       9.4, 14.5, 13.9, 20.7, 17.9, 8.5, 55.4, 38.1, 54.2, 21.5, 26.2, 59.1, 43.3 ]

sample_mean=mean(data)
sample_median=median(data)
trimmed_mean=trimmean(data,20)

fprintf("(a)%f\r(b)%f\r",sample_mean,sample_median)

histogram(data,10)
title('relative frequency histogram')

fprintf("(d)%f\r",trimmed_mean)