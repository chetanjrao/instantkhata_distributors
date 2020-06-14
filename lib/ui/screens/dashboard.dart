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
                title: Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Dashboard",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 18.0
                    ),
                  ),
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
              )
            ],
          )
        )
      );
  }
}