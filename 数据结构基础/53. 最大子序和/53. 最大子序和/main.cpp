//
//  main.cpp
//  53. 最大子序和
//
//  Created by luokan on 2021/2/19.
//

#include <iostream>
#include <vector>
using namespace std;

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

int main(int argc, const char * argv[]) {

    vector<int> vt{-2,1,-3,4,-1,2,1,-5,4};
    
    Solution sl;
    cout << "最大" << sl.maxSubArray(vt) << endl;
    
    return 0;
}
