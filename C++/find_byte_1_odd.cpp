#include <iostream>

using namespace std;

static int BYTE_COUNT = 32;
static int START_FROM = 10;
static int END_TO = 20;

int *decimal_to_binary(int decimal)
{
    int* binary = new int[BYTE_COUNT];
    int i = BYTE_COUNT;
    for (int j = 0; j < BYTE_COUNT; j++) {
        binary[j] = 0;
    }
    while(decimal > 0) {
        int binary_number = decimal % 2;
        binary[--i] = binary_number;
        decimal /= 2;
    }
    return binary;
}

int main()
{
    int * array = new int[0];
    int odd_count = 0;
    int odd_count_result = 0;
    for (int i = START_FROM; i < END_TO; i++) {
       array = decimal_to_binary(i);
       cout << "\n" << i << " -> ";
       for (int j = 0; j < BYTE_COUNT; j++) {
           if (1 == array[j]) {
               odd_count++;
           }
           cout << array[j];
       }
       if (odd_count % 2 == 1) {
           odd_count_result++;
           odd_count = 0;
       }
    }
    cout << "\n" << START_FROM << " to " << END_TO << " = " << odd_count_result << " odd 1 bytes" << endl;
    delete array;
    return 0;
}
