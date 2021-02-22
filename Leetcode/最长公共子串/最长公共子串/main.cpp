//
//  main.cpp
//  最长公共子串
//
//  Created by luokan on 2021/2/22.
//

#include <iostream>
#include <vector>
#include <string>
using namespace std;

// 时间复杂度n*m  O(n*m)
class Solution {
    
    public:
    int longcommonsubstring(string st1,string st2){
    
        int len1 = (int)st1.length();
        int len2 = (int)st2.length();
        if(len1 == 0 || len1 == 0) return 0;
        
        vector<vector<int>> dp(len1+1,vector<int>(len2+1,0));
        int maxDP = 0;
        for (int i = 1; i<=len1; i++) {
            for (int j = 1; j<=len2; j++) {
                
                // str 也是走0 开始算
                if(st1.at(i-1) == st2.at(j-1)){
                    dp[i][j] = dp[i-1][j-1]+1;
                }else{
                    dp[i][j] = 0;
                }
                maxDP = max(dp[i][j],maxDP);
            }
        }
        return maxDP;
    }
    
};

int main(int argc, const char * argv[]) {

    
    Solution sl;
    int len =  sl.longcommonsubstring("ABCDEF", "BABCDEE");
    cout << "长度" << len << endl;
    
    return 0;
}
