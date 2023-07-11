import 'package:flutter/material.dart';

class BoxWidget extends StatelessWidget {
  BoxWidget({required this.colour, this.cardChild});
  final Color colour;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: colour, borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
