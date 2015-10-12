#include <stdlib.h> // srand(), rand(), RAND_MAXを使うため宣言
#include <stdio.h> // printf()を使うために宣言
#include <time.h> // time()を使うために宣言

int main(){
	// forループ用変数
	int i = 0;
	// 円の半径
	double radius = 1.0;
	// 計算結果を納める変数
	double result = 0.0;

	// 円の中にいる点の個数
	int dotsInCircle = 0;
	// 点を打つ数
	// (打つ数を増やすと円周率を求める精度が上がる)
	int dotsNum      = 10;

	// ある一点のxy座標
	double x = 0, y = 0;

	// 円の中にいる点の割合
	double ratio = 0;

	// 乱数を実行時の時間で初期化
	srand((unsigned)time(NULL));

	for(i = 0; i < dotsNum; i++) {
		// ある一点の座標(0から1)を作成
		x = (double) rand() / RAND_MAX;
		y = (double) rand() / RAND_MAX;

		result = x * x + y * y;
		// 円の中にいるか判定
		if(result < radius) {
			// 中にいるならばdotsInCircleで数える
			dotsInCircle++;
		}
	}

	// dotsInCircleがdotsNumに占める割合を求める
	ratio = (double) dotsInCircle / dotsNum;
	// 4倍する
	ratio *= 4;
	// 結果を表示する
	printf("%lf", ratio);

	return 0;
}
