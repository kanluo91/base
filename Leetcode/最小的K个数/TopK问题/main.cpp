//
//  main.cpp
//  TopK问题
//
//  Created by luokan on 2021/4/1.
//

#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    
    int pivot(vector<int> &array,int beign,int end){
        if(end-beign<1)return beign;
        int randomidx = beign+arc4random()%(end-beign);
        swap(array[beign],array[randomidx]);
        int pivotvale = array[beign];
        end--;
        while(beign<end){
            while (beign < end) {
                if(array[end] > pivotvale){
                    end--;
                }else{
                    array[beign++] = array[end];
                    break;
                }
            }
            
            while (beign<end) {
                if(array[beign] < pivotvale){
                    beign++;
                }else{
                    array[end--] = array[beign];
                    break;
                }
            }
 
        }
        array[beign] = pivotvale;
        return beign;
    }
    
    void qsort(vector<int>&array,int begin,int end,int k){
        if(end - begin < 1) return;
        int pivotidx = pivot(array, begin, end);
        if(pivotidx == k) return;
        if(pivotidx > k){
            qsort(array, begin, pivotidx, k);
        }else if(pivotidx < k){
            qsort(array, pivotidx+1, end, k);
        }
    }
    
    vector<int> getLeastNumbers(vector<int>& arr, int k) {
        if(arr.size() == 0) return {};
        qsort(arr, 0, arr.size(), k);
        return vector<int>{arr.begin(),arr.begin()+k};
    }
};


int main(int argc, const char * argv[]) {

//    vector<int> vt{1,-1,-3,21,13,87,66,32,-80,99,120};
    vector<int> vt{0,1,2,1};
    //-80,-3,-1,1,13,21,32,66,87,99,120
    Solution sl;
    vector<int> resutl = sl.getLeastNumbers(vt, 1);
    for (int i = 0; i<resutl.size(); i++) {
        printf("%d,",resutl[i]);
    }
    
    return 0;
}
