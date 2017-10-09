#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */   
    long int a[5],sum=0;
    for(int i=0;i<=4;i++)
    {
        cin>>a[i];
        sum=sum+a[i];
        
    }
    sort(a,a+5);
    cout<<sum-a[4]<<" "<<sum-a[0];
    return 0;
}