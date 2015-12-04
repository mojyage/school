//
//  main.c
//  読み込み
//
//  Created by 諸星南菜 on 2015/10/16.
//  Copyright © 2015年 諸星南菜. All rights reserved.
//　data.txtを読み込んで総和をもとめる

#include <stdio.h>

int main(int argc, const char *argv[]) {
    FILE *fp;
    int num;

    fp = fopen("data.txt", "r");
    fscanf(fp, "%d", &num);
    printf("%d\n", num);
    return 0;
}
