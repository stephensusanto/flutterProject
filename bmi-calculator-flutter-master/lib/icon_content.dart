import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const size = 80.0;
const height = 10.0;
const fontSize = 15.0;

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: size,
          color: Colors.white,
        ),
        SizedBox(
          height: height,
        ),
        Text(label, style: TextStyle(fontSize: fontSize))
      ],
    );
  }
}
