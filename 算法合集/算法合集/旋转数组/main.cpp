//
//  main.cpp
//  旋转数组
//
//  Created by luokan on 2021/3/30.
//

#include <iostream>
#include <vector>
using namespace std;
class Solution {
public:
    void rotate(vector<int>& nums, int k) {
        unsigned long len = nums.size();
        k = k%len;
        vector<int> res;
        for (int i =0; i<len; i++) {
            int idx = (i+k)%len;
            res[idx] = nums[i];
        }
        nums = res;
    }
};
int main(int argc, const char * argv[]) {
    vector<int> vt = {1,2,3,4,5,6,7};
    Solution sl;
    sl.rotate(vt, 3);
    return 0;
}
