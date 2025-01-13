import 'package:flutter/material.dart';
import 'package:memory_game/card.dart';

class FlippingCard extends StatefulWidget {
  final String text;
  final Color color;
  final bool isFront;
  final bool isComplete;
  final void Function(int) handleChange;
  final int index;
  const FlippingCard({super.key, required this.text, required this.color, required this.isFront, required this.isComplete, required this.handleChange , required this.index});

  @override
  State<FlippingCard> createState() => _FlippingCardState();
}

class _FlippingCardState extends State<FlippingCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(!widget.isComplete){
          widget.handleChange(widget.index);
        }
      },
      child: AnimatedContainer(
        duration: widget.isComplete == false ? const Duration(milliseconds: 1500) : Duration.zero,
        child: widget.isFront
            ? CardT(text: widget.text, color: widget.color) :
              const CardT(text: "?", color: Colors.amber)
            
      ),
    );
  }
}
