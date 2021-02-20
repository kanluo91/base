//
//  main.cpp
//  53. 最大子序和
//
//  Created by luokan on 2021/2/19.
//

#include <iostream>
#include <vector>
using namespace std;

#pragma mark -
#pragma mark 分治
class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        return _maxSubArray(nums, 0, (int)nums.size());
    }
    
    /// 求[begin,end) 中最大连续子序列和
    /// @param nums 数组
    /// @param begin 其实位置
    /// @param end 结束位置
    int _maxSubArray(vector<int> &nums,int begin,int end){
        if(end - begin < 2) return nums.at(begin);
        int mid = (begin+end) >> 1;
        
        // 全在左边
        int leftMax = _maxSubArray(nums, begin, mid);
        // 全在右边
        int rightMax= _maxSubArray(nums, mid, end);
        
        // 左 右都有的情况
        // 左边
        int _leftMax = INT_MIN;
        int _leftSum = 0;
        for(int i = mid-1;i>=begin;i--){
            _leftSum += nums.at(i);
            _leftMax = max(_leftMax,_leftSum);
        }
        
        // 右边
        int _rightMax = INT_MIN;
        int _rightSum = 0;
        for(int i = mid;i<end;i++){
            _rightSum += nums.at(i);
            _rightMax = max(_rightSum,_rightMax);
        }
        int midMax = _leftMax+_rightMax;
        
        return max(max(leftMax,rightMax),midMax);
    }
};


#pragma mark -
#pragma mark 动态规划 版本-1
class Solution1 {
public:
    int maxSubArray(vector<int>& nums) {
        if(nums.size() == 0) return 0;
        
        int dp[nums.size()];
        memset(dp, 0, sizeof(int)*nums.size());
        dp[0] =  nums.front();
        int result = dp[0];
        for (int i = 1; i<nums.size(); i++) {
            if(dp[i-1] >= 0)
            {
                dp[i] = dp[i-1] + nums.at(i);
            }else{
                dp[i] = nums.at(i);
            }
            
            result = max(dp[i],result);
        }
        return result;
    }
};


#pragma mark -
#pragma mark 动态规划 版本-2 优化dp数组
class Solution2 {
public:
    int maxSubArray(vector<int>& nums) {
        if(nums.size() == 0) return 0;
        
        int lastDP,currentDP;
        currentDP = lastDP =  nums.front();
        int result = lastDP;
        for (int i = 1; i<nums.size(); i++) {
            if(lastDP >= 0)
            {
                currentDP = lastDP + nums.at(i);
            }else{
                currentDP = nums.at(i);
            }
            lastDP = currentDP;
            result = max(currentDP,result);
        }
        return result;
    }
};

int main(int argc, const char * argv[]) {

    vector<int> a{-2,1,-3,4,-1,2,1,-5,4,9};
    
    Solution sl;
    cout << "最大" << sl.maxSubArray(a) << endl;
    
    cout  << "排序 " << endl;
     sort(a.begin(), a.end());
     for (vector<int>::iterator it = a.begin(); it != a.end(); it++){
         cout << *it << "_";
     }
    cout << endl;
    return 0;
}
