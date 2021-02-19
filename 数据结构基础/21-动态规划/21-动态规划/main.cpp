//
//  main.cpp
//  21-动态规划
//
//  Created by luokan on 2021/1/28.
//

#include <iostream>
#include <vector>
using namespace std;

#pragma mark -
#pragma mark 1. 贪心算法
int coinChange(vector<int>& coins, int amount) {
    
    // 1. 金币小于0 情况
    if(amount <= 0) return 0;
    
    // 2. 正好等于金币数   返回1
    for(int i = 0;i<coins.size();i++){
        if(coins.at(i) == amount){
            return 1;
            break;
        }
    }
    
    int minValue = INT_MAX;
    for(int i = 0;i<coins.size();i++){
        int coinvalue = coins.at(i);
        int ct = coinChange(coins,amount-coinvalue);
        minValue = min(minValue,ct);
    }
    return minValue+1;
}

#pragma mark -
#pragma mark 2 贪心改进 -防止重复计算
int coinChange2_(vector<int>& coins, int amount,int * dp) {
    if(dp[amount] != 0){
        return dp[amount];
    }
    
    int tmp = INT_MAX;
    for(int i = 0; i<coins.size(); i++) {
        tmp = min(tmp,coinChange2_(coins, amount-coins.at(i), dp));
    }
    
    dp[amount] = tmp+1;
    return dp[amount];
}

int coinChange2(vector<int>& coins, int amount) {
    if(amount < 1) return -1;
    // amount 小于全部的金币额度
    bool all = false;
    for (int i = 0; i<coins.size(); i++) {
        if(coins.at(i) < amount){
            all = true;
        }else{
            all = false;
            break;
        }
    }

    if(all == false){
        return -1;
    }
    
    int dp[amount+1];
    return coinChange2_(coins,amount,dp);
}

int main(int argc, const char * argv[]) {

    vector<int> v;
    v.push_back(1);
    v.push_back(2);
    v.push_back(5);
    int pc = coinChange(v, 11);
//    int pc = coinChange2(v, 11);
    cout << "数量" << pc<<endl;
    return 0;
}
