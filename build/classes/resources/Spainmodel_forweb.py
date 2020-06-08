# -*- coding: utf-8 -*-
"""
Created on Tue Jun  2 20:22:13 2020

@author: 10128
"""
import math
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
import sys
import datetime


plt.rcParams['font.sans-serif'] = ['KaiTi']
plt.rcParams['axes.unicode_minus'] = False


def calc(T, b1, b2, b3, b4):
    j=9
    k=5
    m=0
    js=j
    ks=k
    ms=m

    for i in range(0, len(T) - 1):
        if(i >= date1):
            if(date1 <= 59 ):
                if(strategy1==1):
                    j=js-4
                    k=ks-4 #注意不要让值减少到负数！！！
                    #如果m大于4，要写 m=m-4
                elif(strategy1==2):
                    j=js-1
                    k=ks-1
                elif(strategy1==3):
                    j=js-3
                    k=ks-3
                elif(strategy1==4):
                    j=5
                    k=5
            elif(date1 <= 88):
                if (strategy1 == 1):
                    k = ks - 4
                elif (strategy1 == 2):
                    k = ks - 1
                elif (strategy1 == 3):
                    k = ks - 3
                elif (strategy1 == 4):
                    k = 5
            elif(date1 <=95):
                # 因为m=0，所以不能再减少了，只有第4条有作用
                # if (strategy1 == 1):
                #     m = m - 4
                # elif (strategy1 == 2):
                #     m = m - 1
                # elif (strategy1 == 3):
                #     m = m - 3
                if (strategy1 == 4):
                    m = 5

        if (i >= date2):
            if (date2 <= 59):
                if (strategy2 == 1):
                    j = js - 4
                    k = ks - 4  # 注意不要让值减少到负数！！！
                    # 如果m大于4，要写 m=m-4
                elif (strategy2 == 2):
                    j = js - 1
                    k = ks - 1
                elif (strategy2 == 3):
                    j = js - 3
                    k = ks - 3
                elif (strategy2 == 4):
                    j = 5
                    k = 5
            elif (date2 <= 88):
                if (strategy2 == 1):
                    k = ks - 4
                elif (strategy2 == 2):
                    k = ks - 1
                elif (strategy2 == 3):
                    k = ks - 3
                elif (strategy2 == 4):
                    k = 5
            elif (date2 <= 95):
                # 因为m=0，所以不能再减少了，只有第4条有作用
                # if (strategy1 == 1):
                #     m = m - 4
                # elif (strategy1 == 2):
                #     m = m - 1
                # elif (strategy1 == 3):
                #     m = m - 3
                if (strategy2 == 4):
                    m = 5
        if (i >= date3):
            if (date3 <= 59):
                if (strategy3 == 1):
                    j = js - 4
                    k = ks - 4  # 注意不要让值减少到负数！！！
                    # 如果m大于4，要写 m=m-4
                elif (strategy3 == 2):
                    j = js - 1
                    k = ks - 1
                elif (strategy3 == 3):
                    j = js - 3
                    k = ks - 3
                elif (strategy3 == 4):
                    j = 5
                    k = 5
            elif (date3 <= 88):
                if (strategy3 == 1):
                    k = ks - 4
                elif (strategy3 == 2):
                    k = ks - 1
                elif (strategy3 == 3):
                    k = ks - 3
                elif (strategy3 == 4):
                    k = 5
            elif (date3 <= 95):
                # 因为m=0，所以不能再减少了，只有第4条有作用
                # if (strategy1 == 1):
                #     m = m - 4
                # elif (strategy1 == 2):
                #     m = m - 1
                # elif (strategy1 == 3):
                #     m = m - 3
                if (strategy3 == 4):
                    m = 5






        if (i <= 59):  # 改为 旧r1=新(r1+r3) 旧r2=新(r2+r4)=20.23 这里要保证r1>r3 r2>r4
            r1=14.93*js*0.1# 每个患病者每天接触不知情者的人数---调试中
            r2=14.93*js*0.1 # 潜伏者每天接触不知情者的人数---调试中
            r3=14.93-r1# 患病者每天接触知情者的人数---调试中
            r4=14.93-r2 # 潜伏者每天接触知情者的人数---调试中
            r11 = r1
            r12 = r2
            r13 = r3
            r14 = r4




        elif (i <= 88):  # 旧r1=新(r1+r3) 旧r2=新(r2+r4)=20.23  r1=50 r2=4
            r1 = 16.86*ks*0.1
            r2 = 4*ks*0.1
            r3 =16.86-r1 #--调试中
            r4 =4-r2 #--调试中
            r21 = r1
            r22 = r2
            r23 = r3
            r24 = r4




        elif (i <= 95):
            r1 = (16.86 - (i - 88) * 2.4085714285714)*ms*0.1
            r2 = 4*ms*0.1
            r3 =  (16.86 - (i - 88) * 2.4085714285714)-r1 #--调试中
            r4 =  4-r2 #--调试中
            r31 = r1
            r32 = r2
            r33 = r3
            r34 = r4


        else:
            r1 = 0
            r2 = 0
            r3 = 4  # --调试中---估计就是这个
            r4 = 4  # --调试中-估计就是这个



        S.append(
            S[i] - r1 * b1 * S[i] * I[i] / N - r2 * b2 * S[i] * E[i] / N - r3 * b3 * S[i] * I[i] / N - r4 * b4 * S[i] *
            E[i] / N)
        E.append(E[i] + r1 * b1 * S[i] * I[i] / N - a * E[i] + r2 * b2 * S[i] * E[i] / N + r3 * b3 * S[i] * I[
            i] / N + r4 * b4 * S[i] * E[i] / N)
        I.append(I[i] + a * E[i] - y * I[i])
        R.append(R[i] + y * I[i])
        if (I[i] - I[i - 1] < 0 and I[i - 1] - I[i - 2] > 0 and not (i == 1)):
            # print()
            result1 = i - 1
            result2 = math.floor(I[i - 1])
            # print((i-1))
            # print(math.floor(I[i-1]))
        if (E[i] - E[i - 1] < 0 and E[i - 1] - E[i - 2] > 0 and not (i == 1)):
            # print()
            result3 = i - 1
            result4 = math.floor(E[i - 1])
    # 新加的
    result5 = int(I[int(nowdate)])  # 本日预测

    if (int(I[int(nowdate)] - I[int(nowdate) - 1]) >= 0):
        result6 = "+" + str(int(I[int(nowdate)] - I[int(nowdate) - 1]))  # 较昨日
    else:
        result6 =str(int(I[int(nowdate)] - I[int(nowdate) - 1]))
    # result5= int(I[int(nowdate)] )#本日预测
    # result6 = int(I[int(nowdate)] -I[int(nowdate)-1]) # 较昨日
    result7 = int(I[int(nowdate) + 1])  # 明日预测
    if (int(I[int(nowdate) + 1] - I[int(nowdate)]) >= 0):
        result8 = "+" + str(int(I[int(nowdate) + 1] - I[int(nowdate)]))  # #较今日
    else:
        result8 =str(int(I[int(nowdate) + 1] - I[int(nowdate)]))
    # result8 = int(I[int(nowdate)+1] - I[int(nowdate) ])  # 较今日

    print(result1)
    print(result2)
    print(result3)
    print(result4)
    print(result5)
    print(result6)
    print(result7)
    print(result8)


def plot(T, S, E, I, R):
    # plt.figure()
    # plt.title("SEIR-病毒传播时间曲线")
    # plt.plot(T, S, color='r', label='易感者')
    # plt.plot(T, E, color='k', label='潜伏者')
    # plt.plot(T, I, color='b', label='传染者')
    # plt.plot(T, R, color='g', label='康复者')
    # plt.grid(False)
    # plt.legend()
    # plt.xlabel("时间(天)")
    # plt.ylabel("人数")
    # plt.show()
    # (plt.figure()).savefig("graph4-13.png")
    fig = plt.figure()
    plt.title("SEIR-病毒传播时间曲线")
    plt.plot(T, S, color='r', label='易感者')
    plt.plot(T, E, color='k', label='潜伏者')
    plt.plot(T, I, color='b', label='传染者')
    plt.plot(T, R, color='g', label='康复者')
    plt.grid(False)
    plt.legend()
    plt.xlabel("时间(天)")
    plt.ylabel("人数")

    
    # 新加的
    fig.savefig("C:\\Users\\Thinkpad\\eclipse-workspace\\kangyi\\WebContent\\images\\Spaingraph" + s + ".png")
    ss = "Spaingraph" + s + ".png"
    print(ss)
##if __name__ == '__main__':

# 首先还是设置一下参数,之后方便修改
if __name__ == '__main__':
    
    
    #input1 = "2020-03-15"
    #input2 = "1"
    #input3 = "2020-05-11"
    #input4 = "2"
    #input5 = "2020-06-01"
    #input6 = "3"

    #input1 = "null"
    #input2 = "null"
    #input3 = "null"
    #input4 = "null"
    #input5 = "null"
    #input6 = "null"
    
    input1 = sys.argv[1]
    input2 = sys.argv[2]
    input3 = sys.argv[3]
    input4 = sys.argv[4]
    input5 = sys.argv[5]
    input6 = sys.argv[6]
    # 新加的
    if (input1 != "null"):
        date1 = (datetime.datetime.strptime(input1, '%Y-%m-%d') - datetime.datetime.strptime('2020-01-22','%Y-%m-%d')).days
    else:
        date1= -1
    if(input2 != "null"):
        strategy1 = int(input2)
    else:
        strategy1 = -1
    if (input3 != "null"):
        date2 = (datetime.datetime.strptime(input3, '%Y-%m-%d') - datetime.datetime.strptime('2020-01-22','%Y-%m-%d')).days
    else:
        date2 = -1
    if (input4 != "null"):
        strategy2 = int(input4)
    else:
        strategy2 = -1
    if (input5 != "null"):
        date3 = (datetime.datetime.strptime(input5, '%Y-%m-%d') - datetime.datetime.strptime('2020-01-22','%Y-%m-%d')).days
    else:
        date3 = -1
    if (input6 != "null"):
        strategy3 = int(input6)
    else:
        strategy3 = -1
        
    # 新加的
    nowdate = (datetime.datetime.now() - datetime.datetime.strptime('2020-01-22', '%Y-%m-%d')).days
    s = (str(strategy1) + str(date1) + str(strategy2) + str(date2) + str(strategy3) + str(date3)).replace('.', '')


    N = 46730000  #西班牙人口

    a = 0.17  # 潜伏者患病概率
    y = 0.289  # 康复概率

    b1= 0.0200000000  
    b2= 0.0200000000  
    b3= 0.0140000000  
    b4= 0.0140000000 
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
