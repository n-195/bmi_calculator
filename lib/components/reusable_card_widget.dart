import 'package:flutter/material.dart';
import '../constants.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {required this.colour,
      required this.cardChild,
      required this.onPress,
      super.key});

  final Color colour;
  final Widget cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    // TextButton is not used here because it comes with its own
    // padding which will interfere with the predetermined UI.
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: kContainerMargin,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
