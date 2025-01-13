import 'package:flutter/material.dart';

class CardItem {
  final String text; // תוכן הקלף
  final Color color; // צבע הקלף
  bool isFront; // האם הקלף גלוי
  bool isComplete; // האם הקלף הושלם
  final int index; // אינדקס הקלף הייחודי

  CardItem({
    required this.text,
    required this.color,
    this.isFront = false,
    this.isComplete = false,
    required this.index,
  });

  // פונקציה להעתקת קלף עם שינויים
  CardItem copyWith({bool? isFront, bool? isComplete}) {
    return CardItem(
      text: this.text,
      color: this.color,
      isFront: isFront ?? this.isFront,
      isComplete: isComplete ?? this.isComplete,
      index: this.index,
    );
  }
}
