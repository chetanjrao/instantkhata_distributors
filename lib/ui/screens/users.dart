import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> with SingleTickerProviderStateMixin {
  
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Container(
          margin: EdgeInsets.only(top: 6.0),
          child: Text(
            "Phonebook",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        bottom: TabBar(
          isScrollable: false,
          indicatorColor: primaryColor,
          unselectedLabelColor: Colors.grey,
          labelColor: primaryColor,
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(
                "Retailers"
              ),
            ),
            Tab(
              child: Text(
                "Salesman"
              ),
            )
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index){
                return Card(
                  margin: EdgeInsets.only(top: 1.0),
                  elevation: 0.5,
                  child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                index % 2 == 0 ? "Durga Traders" : "Bhairav Sales & Exports",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Doddaballapur Main Road, Avalahalli, Yelahanka, Bengaluru, Karnataka 560064",
                                      overflow: TextOverflow.fade,
                                      maxLines: 4,
                                      style: TextStyle(
                                        
                                        fontSize: 13.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500
                                      ),
                                    )
                                  )
                                ],
                              )
                            )
                          ]
                        )
                        ),
                        Wrap(
                          children: [
                            Container(
                              child: Icon(
                                Feather.phone,
                                color: primaryColor,
                                size: 21.0
                              )
                            ),
                          ]
                        )
                      ]
                    )
                  )
                );
              },
            )
          ),
          Container(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index){
                return Card(
                  margin: EdgeInsets.only(top: 1.0),
                  elevation: 0.5,
                  child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                index % 2 == 0 ? "Chethan J" : "Raghav B",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Doddaballapur Main Road, Avalahalli, Yelahanka, Bengaluru, Karnataka 560064",
                                      overflow: TextOverflow.fade,
                                      maxLines: 4,
                                      style: TextStyle(
                                        
                                        fontSize: 13.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500
                                      ),
                                    )
                                  )
                                ],
                              )
                            )
                          ]
                        )
                        ),
                        Wrap(
                          children: [
                            Container(
                              child: Icon(
                                Feather.phone,
                                color: primaryColor,
                                size: 21.0
                              )
                            ),
                          ]
                        )
                      ]
                    )
                  )
                );
              },
            )
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: (){

        },
        tooltip: 'Add Users',
        backgroundColor: primaryColor,
        child: Icon(Feather.plus),
      ),
    );
  }

}