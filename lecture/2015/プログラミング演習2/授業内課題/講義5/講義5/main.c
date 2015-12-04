//
//  main.c
//  講義5
//
//  Created by 諸星南菜 on 2015/11/20.
//  Copyright © 2015年 諸星南菜. All rights reserved.
//

#include <stdio.h>

double arrayAve(double array[], int num) {
    double sum = 0;
    int i;
    for(i = 0; i < num; i++) {
        sum = sum + array[i];
    }
    return sum / num;
}


int main(void) {
    double x[4] = {1.8,3.9,4.3,1.0};
    printf("%f\n",arrayAve(x,4));
      return 0;
}
