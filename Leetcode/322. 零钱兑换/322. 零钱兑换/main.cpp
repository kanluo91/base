//
//  main.cpp
//  322. 零钱兑换
//
//  Created by luokan on 2021/2/19.
//  https://leetcode-cn.com/problems/coin-change/

#include <iostream>
#include <vector>
using namespace std;

class Solution1{
public:
    int coinChange(vector<int>& coins, int amount) {
        if(amount < 1) return 0;
        int array[amount+1];
        memset(array, 0, sizeof(int)*(amount+1));
        int res = dp(coins, amount, array);
        return res;
    }

    int dp(vector<int>& coins, int amount,int *array){
        if(amount < 0) return -1;
        if(amount == 0) return 0;
        if(array[amount] == 0){
            int subMin = INT_MAX;
            for (int i =0 ; i<coins.size(); i++) {
                
                int subAmount = dp(coins,amount-coins.at(i),array);
                if(subAmount >= 0 && subAmount < subMin){
                    subMin = subAmount + 1;
                }
            }

            if(subMin == INT_MAX){
                array[amount] = -1;
            }else{
                array[amount] = subMin;
            }
        }
        return array[amount];
    }
};

class Solution {
    vector<int>count;
    int dp(vector<int>& coins, int rem) {
        if (rem < 0) return -1;
        if (rem == 0) return 0;
        if (count[rem - 1] != 0) return count[rem - 1];
        int Min = INT_MAX;
        for (int coin:coins) {
            int res = dp(coins, rem - coin);
            if (res >= 0 && res < Min) {
                Min = res + 1;
            }
        }
        count[rem - 1] = Min == INT_MAX ? -1 : Min;
        return count[rem - 1];
    }
public:
    int coinChange(vector<int>& coins, int amount) {
        if (amount < 1) return 0;
        count.resize(amount); // 设置大小
        return dp(coins, amount);
    }
};

int main(int argc, const char * argv[]) {

    vector<int> vt{1,2,5};
    
    Solution1 st;
    int c = st.coinChange(vt, 11);
    
    cout << "需要金币数量" << c << endl;
    return 0;
}
