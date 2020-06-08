import math
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import sys
import datetime

# 程序有误
# 用python实现南京大学李江教授的改进后SEIR模型
# T=0 是2019.12.8日



# f=open("C:\\Users\\Thinkpad\\Desktop\\test.txt",'a')
# T=0----12.8日



if __name__ == '__main__':
    input1 = sys.argv[1]
    input2 = sys.argv[2]
    input3 = sys.argv[3]
    input4 = sys.argv[4]
    input5 =sys.argv[5]
    input6 = sys.argv[6]
    print("input1=")
    print(input1)
	
	# 新加的
    date1 = (datetime.datetime.strptime(input1, '%Y-%m-%d') - datetime.datetime.strptime('2020-01-22', '%Y-%m-%d')).days
    strategy1 = int(input2)
    date2 = (datetime.datetime.strptime(input3, '%Y-%m-%d') - datetime.datetime.strptime('2020-01-22', '%Y-%m-%d')).days
    strategy2 = int(input4)
    date3 = (datetime.datetime.strptime(input5, '%Y-%m-%d') - datetime.datetime.strptime('2020-01-22', '%Y-%m-%d')).days
    strategy3 = int(input6)
	
	# 新加的
    nowdate = (datetime.datetime.now() - datetime.datetime.strptime('2020-01-22', '%Y-%m-%d')).days
    s = (str(strategy1) + str(date1) + str(strategy2) + str(date2) + str(strategy3) + str(date3)).replace('.', '')

    N = 28206734  #

    a = 0.17  # 潜伏者患病概率
    y = 0.289  # 康复概率

    b1 = 0.025
    b2 = 0.025
    b3 = 0.009
    b4 = 0.009
    T = [i for i in range(0, 140)]  # 时间
    E = []  # 潜伏携带者

    E.append(0)

    I = []  # 患病的人

    I.append(1)

    S = []  # 易感者

    S.append(N - I[0])

    R = []  # 康复者

    R.append(0)
    calc(T, b1, b2, b3, b4)

    plot(T, S, E, I, R)
    print(nowdate)

    