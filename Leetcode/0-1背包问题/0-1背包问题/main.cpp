//
//  main.cpp
//  0-1背包问题
//
//  Created by luokan on 2021/2/22.
//  动态规划 0-1 背包问题

#include <iostream>
#include <vector>
#include <string>
using namespace std;


// dp(i,j)  i为物品可选  j为当前最大可承重
// dp(i,0)  dp(0,j)  都为 0
int maxpackage(vector<int> &values,vector<int> &weights,int capacity){
    
    if(capacity <= 0 || weights.size() == 0 || values.size() == 0) return 0;
    
    int cnt = (int)values.size();
    
    // vector(num,value)
    vector<vector<int>> dp(cnt+1,vector<int>(capacity+1,0));
    
    int result = 0;
    for (int i = 1; i <= cnt ; i++) {
        for (int j = 1; j<=capacity; j++) {
            
            int weight = weights.at(i-1); // 最后一个的重量
            // 没得选
            if(j < weight) {
                dp[i][j] = dp[i-1][j];
            }
            else{// 有得选
                
                // 1. 选的情况
                int v1 = dp[i-1][j-weight]+ values.at(i-1);
                
                // 2. 不选的情况
                int v2 = dp[i-1][j];
                
                dp[i][j] = max(v1, v2);
                
            }
            result = max(result,dp[i][j]);
        }
    }
    
    return result;
}


int main(int argc, const char * argv[]) {

    vector<int> values{6,3,5,4,6};
    vector<int> weights{2,2,6,5,4};
    int capacity = 10;
    
    int maxweight = maxpackage(values,weights, capacity);
    
    cout << "最大价值" <<  maxweight << endl;
    
    return 0;
}
