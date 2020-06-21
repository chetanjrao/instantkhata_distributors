import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:instantkhata_distributors/ui/utils/components.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:instantkhata_distributors/ui/utils/header.dart';

class Sales extends StatefulWidget {
  @override
  _SalesState createState() => _SalesState();
}

class _SalesState extends State<Sales> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   elevation: 2.0,
        //   onPressed: (){

        //   },
        //   tooltip: 'Increment',
        //   backgroundColor: primaryColor,
        //   child: Icon(Feather.plus),
        // ),
      //  backgroundColor: Color(0xFFf2f5ff),
        body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 1.0,
                forceElevated: true,
                bottom: PreferredSize(
                  child: Container(width: 0.0, height: 0.0),
                  preferredSize: Size.fromHeight(12.0)
                ),
                title: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Reports",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 20.0
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 12.0, right: 6.0),
                    //   child: CircleAvatar(
                    //     radius: 14.0,
                    //     backgroundImage: AssetImage(
                    //       "assets/profile.png"
                    //     ),
                    //   ),
                    // )
                  ]
                )
              ),
              SliverToBoxAdapter(
                child: Card(
                  margin: EdgeInsets.only(top: 6.0),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    child: Wrap(
                        children: [
                          Wrap(
                            alignment: WrapAlignment.center,
                            direction: Axis.horizontal,
                            children: [
                              Container(
                                child: DataCard(dataCount: "5,097", dataTag: "Transactions", icon: Feather.arrow_up_right, color: Color(0xFF0db278), dataStats: "+33.50%", backgroundColor: Color(0xFF0db278).withOpacity(0.2)),
                              ),
                              Container(
                                child: DataCard(dataCount: "897", dataTag: "Items sold", icon: Feather.arrow_down_right, color: Color(0xFFfc2b2b), dataStats: "-22.89%", backgroundColor: Color(0xFFfc2b2b).withOpacity(0.2)),
                              )
                            ],
                          )
                        ]
                      ),
                  )
                )
              ),
              SliverToBoxAdapter(
                child: Card(
                  margin: EdgeInsets.only(top: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 12.0, left: 6.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Transactions this month",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey
                                ),
                              ),
                              Text(
                                "255",
                                style: TextStyle(
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.w600
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
                                        color: Color(0xFF0db278).withOpacity(0.2)
                                      ),
                                      child: Icon(
                                        Feather.arrow_up_right,
                                        size: 14.0,
                                        color: Color(0xFF0db278),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8.0),
                                      child: Text.rich(
                                        TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "+19.60% ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF0db278)
                                            ),
                                          ),
                                          TextSpan(
                                            text: " for last month",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey
                                            ),
                                          )
                                        ]
                                      ))
                                    )
                                  ]
                                )
                              )
                            ]
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24.0, left: 8.0),
                          child: BarChart(
                          BarChartData(
                            maxY: 300,
                            gridData: FlGridData(
                              horizontalInterval: 100.0,
                              getDrawingHorizontalLine: (data){
                                return FlLine(
                                  dashArray: [5, 12],
                                  strokeWidth: 0.5,
                                  color: Colors.grey
                                );
                              }
                            ),
                            titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              textStyle: TextStyle(
                                  color: const Color(0xff7589a2), 
                                  fontWeight: FontWeight.normal, 
                                  fontFamily: "Axiforma",
                                  fontSize: 13
                                ),
                              margin: 12,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Week 1';
                                  case 1:
                                    return 'Week 2';
                                  case 2:
                                    return 'Week 3';
                                  case 3:
                                    return 'Week 4';
                                  default:
                                    return '';                                
                                }
                              },
                            ),
                            leftTitles: SideTitles(
                                showTitles: true,
                                textStyle: TextStyle(
                                    color: const Color(0xff7589a2), 
                                    fontWeight: FontWeight.normal, 
                                    fontFamily: "Axiforma",
                                    fontSize: 13
                                  ),
                                margin: 16,
                                getTitles: (value){
                                  return value % 50 == 0 ? "${value.toInt()}" : "";
                                }
                              ),
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            barGroups: [
                              BarChartGroupData(
                                  x: 0,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 123, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 1,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 200, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 2,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 155, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 3,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 223, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ])
                            ],
                            ) 
                          )
                        ),
                      ]
                    )
                  )
                ),
              ),
              SliverStickyHeader(
              header: Container(
                margin: EdgeInsets.only(left: 12.0, top: 36.0),
                child: Text(
                  "Leaderboard",
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
                                "CJ",
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
                                    "Chethan J",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0
                                    )
                                  )
                                ),
                                Container(
                                  child: Text(
                                    "+9110466718",
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
                              Container(
                                child: Text(
                                  "300 sales",
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
                childCount: 3
              )
            ),
            ),
            ],
          )
        )
      );
  }
}