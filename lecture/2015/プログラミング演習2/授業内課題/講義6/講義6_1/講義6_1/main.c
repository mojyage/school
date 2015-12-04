//
//  main.c
//  講義6_1
//
//  Created by 諸星南菜 on 2015/12/04.
//  Copyright © 2015年 諸星南菜. All rights reserved.

//　標準偏差を求める

#include <stdio.h>
#include <math.h>

double stdevp(int array[],int num) {
    double ave,sum = 0;   //平均,合計
    double variance = 0;  //分散
    int i;
    for (i = 0; i < num; i++) {
        sum = sum + array[i];
    }
    ave = sum / num;
    for (i = 0; i < num; i++){
        variance = variance + (array[i] - ave) * (array[i] - ave);
    }
    variance = variance / num;
    return sqrt(variance);
}

int main(void) {
    int data[10] = {1,1,1,1,1,1,1,1,1,1};
    printf("%f\n",stdevp(data, 10));
    return 0;
}