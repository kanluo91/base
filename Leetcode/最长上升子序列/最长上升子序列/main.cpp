//
//  main.cpp
//  最长上升子序列
//
//  Created by luokan on 2021/2/20.
//

#include <iostream>
#include <vector>
using namespace std;


// dp[i]  是以i为结尾的 最大序列
// 不要求连续
class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        
        if(nums.size() == 0) return 0;
        int size = (int)nums.size();
        int dp[size];
        memset(dp, 0, sizeof(int)*size);
        dp[0] = 1;
        int result = dp[0];
        for (int i = 1; i<size; i++) {
            int curValue = nums.at(i);
            // 要跟前面每一个比
            int maxDP_I = 1;
            for(int begin = 0;begin < i;begin++){
                int preValue = nums.at(begin);
                if(curValue > preValue){
//                  maxDP_I = dp[begin] + 1;
                    maxDP_I = max(maxDP_I,dp[begin] + 1);
                }
            }
            dp[i] = maxDP_I;
            result = max(dp[i],result);
        }
        return result;
    }
};

int main(int argc, const char * argv[]) {
    // insert code here...
    vector<int> vt {0,1,0,3,2,3};//{10,9,2,5,3,7,101,18};
    Solution sl;
    int result = sl.lengthOfLIS(vt);
    cout << "结果" << result<<endl;
    
    return 0;
}
