//
//  main.cpp
//  1143. 最长公共子序列
//
//  Created by luokan on 2021/2/22.
//

#include <iostream>
#include <vector>
using namespace std;

// 递归的算法  时间复杂度O(2^n)
class Solution1 {
public:
    int longestCommonSubsequence(string text1, string text2) {
        if(text1.length() ==0 || text2.length() == 0) return 0;
        int i = (int)text1.length();
        int j = (int)text2.length();
        return dp(text1,text2,i,j);
    }
    
    // [0,len1] [0,len2] 之前的最长公共子序列

    /// 求text1 text2 前i，j 长度的最长公共子序列
    /// @param text1 字符串1
    /// @param text2 字符串2
    /// @param i 长度1
    /// @param j 长度2
    int dp(string text1,string text2 ,int i,int j){
        if(i == 0 || j == 0) return 0;
        if(text1.at(i-1) == text2.at(j-1)){
            return dp(text1,text2,i-1,j-1)+1;
        }else{
            // 2种情况  交叉
            int s1 = dp(text1,text2,i-1,j);
            int s2 = dp(text1,text2,i,j-1);
            return max(s1,s2);
        }
    }
};

// 动态规划
class Solution {
public:
    int longestCommonSubsequence(string text1, string text2) {
        vector<vector<int>> dp(text1.size() + 1, vector<int>(text2.size() + 1, 0));
        for (int i = 1; i <= text1.size(); i++) {
            for (int j = 1; j <= text2.size(); j++) {
                if (text1[i - 1] == text2[j - 1]) {
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                } else {
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
                }
            }
        }
        return dp[text1.size()][text2.size()];
    }
};

int main(int argc, const char * argv[]) {
  
    Solution1 sl;
    int len =  sl.longestCommonSubsequence("ylqpejqbalahwr", "yrkzavgdmdgtqpg");
    
    cout << "最长序列" << len<< endl;
    
    
    return 0;
}
