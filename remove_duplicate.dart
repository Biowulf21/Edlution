void main(List<String> args) {
  List<int> removeDuplicateItems(List<int> list) {
    List<int> newList = List.from(list);
    newList.sort();

    for (var i = 1; i < newList.length; i++) {
      if (i + 1 == newList.length) break;

      if (newList[i] == newList[i + 1]) {
        newList.removeAt(i);
      }
    }
    return newList;
  }

  List<int> testListDuplicate = [1, 2, 3, 4, 5, 6, 7, 8, 1, 2];
  List<int> testListNoDuplicate = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  print(removeDuplicateItems(testListDuplicate));
  print(removeDuplicateItems(testListNoDuplicate));
}
