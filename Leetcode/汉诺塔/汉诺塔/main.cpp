//
//  main.cpp
//  汉诺塔
//
//  Created by luokan on 2021/1/4.
//

#include <iostream>
using namespace std;

void MovePlate(int no,string from,string to){
    cout<<"盘子"<<no<<"从"<<from<<"移动到"<<to<<endl;
}

/// 把n个盘子  走p1 挪动到 p3
/// @param n 盘子
/// @param p1  汉诺塔p1
/// @param p2  汉诺塔p2
/// @param p3  汉诺塔p3
void hanio(int n,string p1,string p2,string p3){
    if(n == 1){
        MovePlate(1, p1, p3);
        return;
    }
    hanio(n-1, p1, p3, p2);
    MovePlate(n, p1, p3);
    hanio(n-1, p2, p1, p3);
}

int main(int argc, const char * argv[]) {
    hanio(3 , "A", "B", "C");
    return 0;
}
