import 'package:flutter/material.dart';
import 'package:memory_game/card_item.dart';
import 'package:memory_game/flipping_card.dart';

class GameProvider extends ChangeNotifier {
  bool isFirstTime = true;

  List<CardItem> arr = [
    CardItem(text: "A", color: Colors.red, index: 1),
    CardItem(text: "B", color: Colors.cyan, index: 2),
    CardItem(text: "C", color: Colors.green, index: 3),
    CardItem(text: "D", color: Colors.blue, index: 4),
    CardItem(text: "A", color: Colors.red, index: 5),
    CardItem(text: "B", color: Colors.cyan, index: 6),
    CardItem(text: "C", color: Colors.green, index: 7),
    CardItem(text: "D", color: Colors.blue, index: 8),
  ];

  void updateShuffleArrState() {
    if (isFirstTime) {
      arr.shuffle();
      isFirstTime = false;
      notifyListeners(); // Notify listeners after the shuffle
    }
  }

  void handleChange(int index) {
    for (final element in arr) {
      if (element.index == index) {
        element.isFront = !element.isFront;
        checkIF2isFrontExist(element.text);
        break;
      }
    }
    arr = List.from(arr); // Create a new list to ensure proper state management
    notifyListeners(); // Notify listeners after a state change
    checkStatusGame();
  }

  void checkIF2isFrontExist(String text) {
    int counterSameCardsOpen = 0;

    for (final element in arr) {
      if (element.text == text && element.isFront) {
        counterSameCardsOpen++;
      }
    }

    if (counterSameCardsOpen == 2) {
      for (final element in arr) {
        if (element.text == text && element.isFront) {
          element.isComplete = true;
        }
      }
    } else {
      int counterCardsOpen =
          arr.where((e) => e.isFront && !e.isComplete).length;
      if (counterCardsOpen == 2) {
        for (final element in arr) {
          if (element.isFront && !element.isComplete) {
            element.isFront = false;
          }
        }
      }
    }
    notifyListeners(); // Notify listeners after state updates
  }

  void checkStatusGame() {
    int completedCards = arr.where((e) => e.isComplete).length;

    if (completedCards == arr.length) {
      print("Game over you win :)");
    }
    notifyListeners(); // Notify listeners after checking the game status
  }

  List<Widget> buildColumns() {
    List<Widget> columns = [];

    for (int i = 0; i < 2; i++) {
      List<Widget> rows = [];
      for (int x = i * 4; x < (i * 4) + 4; x++) {
        rows.add(FlippingCard(
          text: arr[x].text,
          color: arr[x].color,
          isFront: arr[x].isFront,
          isComplete: arr[x].isComplete,
          index: arr[x].index,
          handleChange: handleChange,
        ));
        if (x < (i * 4) + 3) {
          rows.add(const SizedBox(width: 15));
        }
      }
      columns.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rows,
      ));

      if (i < 1) {
        columns.add(const SizedBox(height: 15));
      }
    }

    return columns;
  }
}
