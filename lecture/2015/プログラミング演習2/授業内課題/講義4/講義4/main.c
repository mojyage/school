//
//  main.c
//  講義4
//
//  Created by 諸星南菜 on 2015/11/06.
//  Copyright © 2015年 諸星南菜. All rights reserved.
//　エラトステネスのふるいを改造してループ毎に配列の全要素を出力

#include <stdio.h>
#define MAX_NUM 500
int main(int argc, const char * argv[]) {
    int prime[MAX_NUM + 1] = {0};
    int i, j;
    prime[0] = 1;
    prime[1] = 1;
    
    //メインのループ
    for(i = 2; i < MAX_NUM; i++) {
        for(j = i + 1; j <= MAX_NUM; j++) {
            if (j % i == 0) {
                prime[j] = 1;
            }
        }
        printf("%d---------------------------------------\n", i);
        for(j = 0; j <= MAX_NUM; j++) {
            if (prime[j] == 0) {
                printf("%d ", j);
            }
        }
         printf("\n");
    }
    for(i = 0; i <= MAX_NUM; i++) {
        if (prime[i] == 0) {
            printf("%d ", i);
        }
    }
    printf("\n");
    return 0;
}