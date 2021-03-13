//
//  main.cpp
//  Stack
//
//  Created by luokan on 2021/3/10.
//

#include <iostream>
#include <stack>
using namespace std;

int main(int argc, const char * argv[]) {
    
    stack<int> st;
    st.push(1);
    st.push(2);
    cout << "top = " << st.top() << endl;
    return 0;
    
}
