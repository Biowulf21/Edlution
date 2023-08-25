main() {
  bool checkIfPalindrom(int number) {
    int reversedNumberString =
        int.parse(number.toString().split('').reversed.join());

    return number == reversedNumberString;
  }

  print(checkIfPalindrom(12321));
  print(checkIfPalindrom(1234));
}
