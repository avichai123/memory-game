import 'package:flutter/material.dart';

class CardT extends StatelessWidget {
  final String text;
  final Color color;
  const CardT({super.key , required this.text , required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Center(child: Text(text,style: const TextStyle(fontSize: 40),)),
    );
  }
}