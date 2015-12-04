//
//  main.c
//  講義6
//
//  Created by 諸星南菜 on 2015/12/04.
//  Copyright © 2015年 諸星南菜. All rights reserved.
//

#include <stdio.h>

int threesum(int x,int y,int z) {
    if(x+y+z >= 10) {
        return 1;
    } else {
        return -1;
    }
}


int main() {
        printf("%d\n",threesum(10,5,-1000));
    return 0;
}
