//
//  main.cpp
//  种花
//
//  Created by luokan on 2021/2/19.
//  https://leetcode-cn.com/problems/can-place-flowers/submissions/

#include <iostream>
#include <vector>
using namespace std;

//class Solution {
//public:
//    bool canPlaceFlowers(vector<int>& flowerbed, int n) {
//        for(int i = 0;i<flowerbed.size() && n>0;i++){
//            int value  = flowerbed.at(i);
//            int leftValue = 0;
//            int rightValue = 0;
//            if(i-1 >= 0){
//                leftValue = flowerbed.at(i-1);
//            }
//            if(i+1 < flowerbed.size()){
//                rightValue = flowerbed.at(i+1);
//            }
//            if(value == 0 && leftValue == 0 && rightValue == 0){
//                n--;
//                cout<< "n = " << n <<endl;
//                flowerbed.at(i) = 1;
//            }
//            if(n <= 0){
//                break;
//            }
//        }
//        if(n == 0){
//            return true;
//        }else{
//            return false;
//        }
//    }
//
//};



// 分糖果
class Solution {
public:
    int candy(vector<int>& ratings) {

            int leftCount = 1;
            int rightCount = 1;
            int curCount = 1;
            int total = 0;
        for(int i = 0;i<ratings.size();i++){
            int curVal = ratings.at(i);
            int leftVal = 0;
            int rightVal = 0;
            if(i-1>=0){
                leftVal = ratings.at(i-1);
            }else{
                leftCount = 0;
            }
            
            if(i+1 < ratings.size()){
                rightVal = ratings.at(i+1);
            }else{
                rightCount = 0;
            }
            if(curVal == leftVal && curVal<rightVal){
                curVal = 1;
            }else if(curVal > leftVal && curVal > rightVal){
                curCount = max(leftCount,rightCount)+1;
            }
            else if(curVal > leftVal || curVal>rightVal){
                curCount = leftCount+1;
            }else{
                curCount = 1;
            }
            total = total+curCount;
            leftCount = curCount;
            
        }
        return total;
    }
};


int main(int argc, const char * argv[]) {

    
    vector<int> vt{1,0,2};
//
//    Solution sol;
//    bool su =  sol.canPlaceFlowers(vt, 1);
//
//    cout<< "是否可以" <<  su << endl;
    
    Solution sl;
    int cnt = sl.candy(vt);
    cout<<"糖果"<< cnt <<endl;
    return 0;
}
