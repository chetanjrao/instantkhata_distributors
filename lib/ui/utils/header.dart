import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final bool showDivider;
  final double width;
  final double fontSize;
  final FontWeight fontWeight;

  const Header({
    Key key,
    @required this.title,
    this.showDivider = false,
    this.width = 0.0,
    this.fontSize = 21.0,
    this.fontWeight = FontWeight.bold
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.0),
          child: Text(
            "$title",
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: FontStyle.normal
            ),
          ),
        ),
        showDivider ? Divider(width: width,) : Container()
      ],
    );
  }
}

class Divider extends StatelessWidget {
  final double width;

  const Divider({ Key key, @required this.width }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0),
      width: width,
      height: 2.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(4.0))
      ),
    );
  }
}