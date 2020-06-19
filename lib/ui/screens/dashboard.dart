import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/utils/components.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:instantkhata_distributors/ui/utils/header.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {



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
                        "Dashboard",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 20.0
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12.0, right: 6.0),
                      child: CircleAvatar(
                        radius: 14.0,
                        backgroundImage: AssetImage(
                          "assets/profile.png"
                        ),
                      ),
                    )
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
                                child: DataCard(dataCount: "\u20b95,097", dataTag: "Sales this month", icon: Feather.arrow_up_right, color: Color(0xFF0db278), dataStats: "+33.50%", backgroundColor: Color(0xFF0db278).withOpacity(0.2)),
                              ),
                              Container(
                                child: DataCard(dataCount: "897", dataTag: "Items sold", icon: Feather.arrow_down_right, color: Color(0xFFfc2b2b), dataStats: "-22.89%", backgroundColor: Color(0xFFfc2b2b).withOpacity(0.2)),
                              ),
                              Container(
                                child: DataCard(dataCount: "245", dataTag: "Transactions", icon: Feather.arrow_up_right, color: Color(0xFF0db278), dataStats: "+112.50%", backgroundColor: Color(0xFF0db278).withOpacity(0.2)),
                              ),
                              Container(
                                child: DataCard(dataCount: "12", dataTag: "Items left", icon: Feather.arrow_down_right, color: Color(0xFFfc2b2b), dataStats: "+22.89%", backgroundColor: Color(0xFFfc2b2b).withOpacity(0.2)),
                              ),
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
                                "Sales this week",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey
                                ),
                              ),
                              Text(
                                "\u20b93,295",
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
                                            text: " for last 7 days",
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
                            maxY: 100,
                            gridData: FlGridData(
                              horizontalInterval: 30.0,
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
                                    return 'Mon';
                                  case 1:
                                    return 'Tue';
                                  case 2:
                                    return 'Wed';
                                  case 3:
                                    return 'Thu';
                                  case 4:
                                    return 'Fri';
                                  case 5:
                                    return 'Sat';
                                  case 6:
                                    return 'Sun';
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
                                  return value % 25 == 0 ? "${value.toInt()}k" : "";
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
                                      y: 63, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 1,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 22, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 2,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 36, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 3,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 45, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 3,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 28, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ]),
                              BarChartGroupData(
                                  x: 5,
                                  barRods: [
                                    BarChartRodData(
                                      width: 18.0,
                                      y: 85, 
                                      color: primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(2.0))
                                    )
                                  ],
                                ),
                            ],
                            ) 
                          )
                        ),
                      ]
                    )
                  )
                ),
              ),
            ],
          )
        )
      );
  }
}