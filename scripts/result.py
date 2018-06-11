import csv
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from sklearn import linear_model

data = []

with open('results.csv','r') as csvfile:
  csv_res = csv.reader(csvfile,delimiter=',')
  for row in csv_res:
    data.append(row)

data = np.array(data)
data = data.T

freq = np.array([float(i) for i in data[0]])
rate = np.array([float(i) for i in data[8]])
power = np.array([float(i) for i in data[38]])
ports = np.array([float(i) for i in data[4]])
width = np.array([float(i) for i in data[2]])
rate_ideal = np.array([float(i) for i in data[9]])
efficiency = np.array([float(i) for i in data[10]])

#############################
'''
model = np.polyfit(rate,power,1)
print(model)

p = np.poly1d(model)
xp = np.linspace(0,17056,100)

plt.scatter(rate,power,color='black')
plt.plot(xp,p(xp),color='red')
plt.show()
'''
#############################i


#############################i

freq_64 = freq[:int(len(freq)/2)]
freq_32 = freq[int(len(freq)/2):]

rate_64 = rate[:int(len(rate)/2)]
rate_32 = rate[int(len(rate)/2):]

rate_ideal_64 = rate_ideal[:int(len(rate_ideal)/2)]
rate_ideal_32 = rate_ideal[int(len(rate_ideal)/2):]

efficiency_64 = rate_ideal[:int(len(efficiency)/2)]
efficiency_32 = rate_ideal[int(len(efficiency)/2):]

#reshape
freq_64 = np.reshape(freq_64,(-1,4))
freq_32 = np.reshape(freq_32,(-1,4))

rate_64 = np.reshape(rate_64,(-1,4))
rate_32 = np.reshape(rate_32,(-1,4))

rate_ideal_64 = np.reshape(rate_ideal_64,(-1,4))
rate_ideal_32 = np.reshape(rate_ideal_32,(-1,4))

efficiency_64 = np.reshape(efficiency_64,(-1,4))
efficiecny_32 = np.reshape(efficiency_32,(-1,4))

#transform
freq_64 = freq_64.T
freq_32 = freq_32.T

rate_64 = rate_64.T
rate_32 = rate_32.T

rate_ideal_64 = rate_ideal_64.T
rate_ideal_32 = rate_ideal_32.T

efficiency_64 = efficiency_64.T
efficiency_32 = efficiency_32.T

colors = ['blue','green','red','black']

for i in range(4):
  #plt.plot(freq_64[i],rate_64[i],color=colors[i])
  #plt.plot(freq_64[i],rate_ideal_64[i],'--',color=colors[i])
  plt.plot(rate_64[i],efficiency_64[i],color=colors[i])
plt.show()

for i in range(4):
  #plt.plot(freq_32[i],rate_32[i],color=colors[i])
  #plt.plot(freq_32[i],rate_ideal_32[i],'--',color=colors[i])
  plt.plot(rate_32[i],efficiency_32[i],color=colors[i])
plt.show()


#############################i


