//
//  main.cpp
//  最小的K个数
//
//  Created by luokan on 2021/3/11.
//

#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {

    return 0;
}

class Solution {
public:
    int partition(vector<int>& arr, int l, int r) {
        int x = arr[l + r >> 1];
        int i = l - 1, j = r + 1;
        while (i < j) {
            do i++; while (arr[i] < x);
            do j--; while (arr[j] > x);
            if (i < j) swap(arr[i], arr[j]);
        }
        return j;
    }
    
    int quickSort(vector<int>& arr, int l, int r, int k) {
        if (l == r) return l;
        int pivot = partition(arr, l, r);
        int left = pivot - l + 1;
        if (left >= k) {
            return quickSort(arr, l, pivot, k);
        } else {
            return quickSort(arr, pivot + 1, r, k - left);
        }
    }
    
    vector<int> getLeastNumbers(vector<int>& arr, int k) {
        int n = arr.size();
        if (k == 0) return {};   // k等于0的时候需要特判
        int index = quickSort(arr, 0, n - 1, k);
        return vector<int>(arr.begin(), arr.begin() + index + 1);
    }
};

