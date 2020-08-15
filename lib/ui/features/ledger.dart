import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
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
              elevation: 0.0,
              expandedHeight: 200.0,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "\u20b956000",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28.0
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0),
                      child: Text(
                        "Sales this month",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.grey
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6.0),
                      child: Text(
                        "+98.00 % to previous month",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: Color(0xFF0db278)
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.0),
                      child: RaisedButton(
                        elevation: 0,
                        hoverElevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))
                        ),
                        color: primaryColor,
                        onPressed: (){},
                        child: Text(
                          "View detailed statistics",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverStickyHeader(
              header: Container(
                margin: EdgeInsets.only(left: 12.0),
                child: Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600
                  )
                )
              ),
              sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index){
                  return  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                      height: 84.0,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //     width: 0.5,
                        //     color: Colors.grey.withOpacity(0.3)
                        //   )
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 2),
                            color: primaryColor.withOpacity(0.05)
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Ayush Trading",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
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
                                      color: primaryColor
                                    )
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6),
                                  child: Text(
                                    "Closing balance: Rs.6,00,845",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.0,
                                      color: Colors.grey
                                    )
                                  )
                                ),
                              ]
                            )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "\u20b950,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                    color: Color(0xFF0db278)
                                  )
                                )
                              ),
                              // Container(
                              //   child: Text(
                              //     "Apr 3, 2020",
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 12.0,
                              //       color: Colors.grey
                              //     )
                              //   )
                              // ),
                            ]
                          )
                        ],
                      )
                    );
                },
                childCount: 2
              )
            ),
            ),
            SliverStickyHeader(
              header: Container(
                margin: EdgeInsets.only(left: 12.0),
                color: Colors.white,
                child: Text(
                  "Yesterday",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600
                  )
                )
              ),
              sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index){
                  return  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                      height: 84.0,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //     width: 0.5,
                        //     color: Colors.grey.withOpacity(0.3)
                        //   )
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 2),
                            color: primaryColor.withOpacity(0.05)
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Ayush Trading",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
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
                                      color: primaryColor
                                    )
                                  )
                                ),
                              ]
                            )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "\u20b950,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                    color: Color(0xFF0db278)
                                  )
                                )
                              ),
                              // Container(
                              //   child: Text(
                              //     "Apr 3, 2020",
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 12.0,
                              //       color: Colors.grey
                              //     )
                              //   )
                              // ),
                            ]
                          )
                        ],
                      )
                    );
                },
                childCount: 8
              )
            ),
            ),
            SliverStickyHeader(
              header: Container(
                margin: EdgeInsets.only(left: 12.0),
                child: Text(
                  "May 28, 2020",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600
                  )
                )
              ),
              sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index){
                  return  Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                      height: 84.0,
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        // border: Border(
                        //   bottom: BorderSide(
                        //     width: 0.5,
                        //     color: Colors.grey.withOpacity(0.3)
                        //   )
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                            offset: Offset(0, 2),
                            color: primaryColor.withOpacity(0.05)
                          )
                        ],
                        color: Colors.white,
                      ),
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Ayush Trading",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
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
                                      color: primaryColor
                                    )
                                  )
                                ),
                              ]
                            )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "\u20b950,000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                    color: Color(0xFF0db278)
                                  )
                                )
                              ),
                              // Container(
                              //   child: Text(
                              //     "Apr 3, 2020",
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.w500,
                              //       fontSize: 12.0,
                              //       color: Colors.grey
                              //     )
                              //   )
                              // ),
                            ]
                          )
                        ],
                      )
                    );
                },
                childCount: 3
              )
            ),
            ),
          ],
        ),
    );
  }
}