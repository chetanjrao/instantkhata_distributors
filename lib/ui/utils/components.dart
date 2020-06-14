import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class DataCard extends StatelessWidget {

  final String dataCount;
  final String dataTag;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;
  final String dataStats;

  const DataCard({
    Key key,
    @required this.dataCount,
    @required this.dataTag,
    @required this.icon,
    @required this.color,
    @required this.dataStats,
    @required this.backgroundColor,
    this.margin = const EdgeInsets.all(0.0)
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 0.45 * MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0.0,
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$dataTag",
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey
                ),
              ),
              Text(
                dataCount,
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.w700
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: backgroundColor
                      ),
                      child: Icon(
                        icon,
                        size: 14.0,
                        color: color,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8.0),
                      child: Text(
                        dataStats,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: color
                        ),
                      )
                    )
                  ]
                )
              )
            ]
          )
        ),
      )
    );
  }
}