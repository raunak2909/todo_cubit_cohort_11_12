import 'dart:io';
import 'dart:math';

void main(){

  print("Enter any no to check if it is armstrong no or not:");
  int no = int.parse(stdin.readLineSync()!);
  int temp = no;

  /// length
  int len = 0;

  while(temp>0){
    temp ~/= 10;
    len++;
  }

  ///result
  ///756 -> 7**3 + 5**3 + 6**3
  num result = 0;
  temp = no;

  while(temp>0){
    int rem = temp % 10;
    result += pow(rem, len);
    temp ~/= 10;
  }

  if(no==result){
    print("Armstrong No");
  } else {
    print("not an Armstrong No");
  }

}