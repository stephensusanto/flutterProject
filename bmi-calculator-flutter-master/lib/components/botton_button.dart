import 'package:flutter/cupertino.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, this.nameButton});
  final Function onTap;
  final String nameButton;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kbottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            nameButton,
            style: kfontStyle,
          ),
        ]),
      ),
    );
  }
}
