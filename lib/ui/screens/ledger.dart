import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class Ledger extends StatefulWidget {
  
  @override
  _LedgerState createState() => _LedgerState();
  
}

class _LedgerState extends State<Ledger> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              forceElevated: true,
              elevation: 1.0,
              pinned: true,
              // expandedHeight: 140.0,
              backgroundColor: Colors.white,
              centerTitle: false,
              title: Container(
                margin: EdgeInsets.only(top: 6.0),
                child: Text(
                  "Ledger",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 8.0)
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index){
                  return  Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                      height: 84.0,
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 54.0,
                            width: 54.0,
                            margin: EdgeInsets.only(right: 16.0),
                            decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.15),
                              borderRadius: BorderRadius.all(Radius.circular(16.0))
                            ),
                            child: Center(
                              child: Text(
                                "A",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.0
                                )
                              )
                            )
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Ayush Trading",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.0
                                    )
                                  )
                                ),
                                Container(
                                  child: Text(
                                    "Invoice #2122",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                      color: Color(0xFF0db278)
                                    )
                                  )
                                ),
                              ]
                            )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "\u20b950,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                  )
                                )
                              ),
                              Container(
                                child: Text(
                                  "Apr 3, 2020",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                    color: Colors.grey
                                  )
                                )
                              ),
                            ]
                          )
                        ],
                      )
                    );
                },
                childCount: 10
              )
            )
          ],
        ),
    );
  }
}