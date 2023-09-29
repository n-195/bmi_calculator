import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent(
    this.icon,
    this.sex, {
    super.key,
  });

  final IconData icon;
  final String sex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        const SizedBox(
          height: kHeightSizedBox,
        ),
        Text(
          sex.toUpperCase(),
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
