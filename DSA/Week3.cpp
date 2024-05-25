#include <iostream>
using namespace std;

int main(){
    int n; cin >> n;

    int a[n];
    for(int i = 0; i < n; i++){
        cin >> a[i];
    }

    for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            if(a[j] == 0){
                swap(a[i], a[j]);
            }
        }
    }
    for(int i = 0; i < n; i++){
        cout << a[i] << " ";
    }
}
