import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> with SingleTickerProviderStateMixin {
  
  TabController _tabController;
  List<String> _categories = [];
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _categories = ["Cereals", "IceCreams", "Groceries", "Miscs"];
    _tabController = new TabController(length: _categories.length, vsync: this);
    super.initState();
  }

  List<Widget> categoryBuilder(){
    List<Widget> _widgets = [];
    for(int i=0; i<_categories.length; i++) {
      _widgets.add(Tab(
        child: Text(
          _categories[i]
        ),
      ));
    }
    return _widgets;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          tabs: categoryBuilder()
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
        ],
      ),
      floatingActionButton: SpeedDial(
          // both default to 16
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 24.0),
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 2.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
              child: Icon(Feather.edit_2, color: primaryColor, size: 18.0),
              backgroundColor: Colors.white,
              label: 'Add Category',
              labelStyle: TextStyle(fontSize: 14.0),
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context, builder: (context){
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Category Name"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: RaisedButton(
                          color: primaryColor,
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Add Category",
                            style: TextStyle(
                              color: Colors.white
                            )
                          )
                        )
                        ),
                      ]
                    )
                  );
              })
            ),
            SpeedDialChild(
              child: Icon(Feather.shopping_cart, color: primaryColor, size: 18.0),
              backgroundColor: Colors.white,
              label: 'Add Inventory',
              labelStyle: TextStyle(fontSize: 14.0),
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context, builder: (context){
                  return Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Feather.x),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Product Name"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Product Cost"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "HSN"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "MRP price per unit"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Base Price"
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: RaisedButton(
                          color: primaryColor,
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Add Item",
                            style: TextStyle(
                              color: Colors.white
                            )
                          )
                        )
                        ),
                      ]
                    )
                  );
              })
            ),
          ],
        ),
    );
  }

}