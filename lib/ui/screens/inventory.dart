import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> with SingleTickerProviderStateMixin {
  
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 5, vsync: this);
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
            "Inventory",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: primaryColor,
          unselectedLabelColor: Colors.grey,
          labelColor: primaryColor,
          controller: _tabController,
          tabs: [
            Tab(
              child: Text(
                "Cereals"
              ),
            ),
            Tab(
              child: Text(
                "Icecreams"
              ),
            ),
            Tab(
              child: Text(
                "Groceries"
              ),
            ),
            Tab(
              child: Text(
                "Mics"
              ),
            ),
            Tab(
              child: Text(
                "Groceries"
              ),
            ),
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: ListView.builder(
              itemCount: 50,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                index % 2 == 0 ? "Sona Masoori" : "Moong Daal",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    "HSN: 2105",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                ),
                                Container(
                                  width: 4.0,
                                  height: 4.0,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "MRP: \u20b9210 per unit",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500
                                    ),
                                  )
                                )
                              ]
                            )
                          ]
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                "Qty",
                                style: TextStyle(
                                  fontSize: 11.0,
                                  color: Colors.grey
                                ),
                              )
                            ),
                            Container(
                              child: Text(
                                index % 2 ==0 ? "50" : "100",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600
                                )
                              )
                            )
                          ]
                        )
                      ]
                    )
                  )
                );
              },
            )
          ),
          Text("Icecreams"),
          Text("Groceries"),
          Text("Mics"),
          Text("Hardware"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 2.0,
        onPressed: (){

        },
        tooltip: 'Add Inventory',
        backgroundColor: primaryColor,
        child: Icon(Feather.plus),
      ),
    );
  }

}