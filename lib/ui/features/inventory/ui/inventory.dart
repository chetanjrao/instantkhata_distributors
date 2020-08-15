import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_event.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_state.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/models/inventory.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:shimmer/shimmer.dart';

class Inventory extends StatefulWidget {
  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> with SingleTickerProviderStateMixin {

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  List<Widget> categoryBuilder(List<CategoryModel> categories){
    List<Widget> _widgets = [];
    for(int i=0; i< categories.length; i++) {
      _widgets.add(Tab(
        child: Text(
          categories[i].name
        ),
      ));
    }
    return _widgets;
  }

  List<Widget> itemBuilder(List<InventoryModel> inventory,List<CategoryModel> categories){
    List<Widget> widgets = [];
    categories.forEach((element) {
      List<InventoryModel> currInventory = inventory.where((elem) => elem.type == element.id).toList();
      widgets.add(
        ListView.builder(
          itemCount: currInventory.length,
          itemBuilder: (context, index){
            return Card(
                  margin: EdgeInsets.only(top: 1.0),
                  elevation: 0.2,
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
                                "${currInventory[index].name}",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500
                                ),
                              )
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    "${currInventory[index].hsn}",
                                    style: TextStyle(
                                      fontSize: 12.5,
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
                                    "\u20b9${currInventory[index].basePrice}",
                                    style: TextStyle(
                                      fontSize: 12.5,
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
                                "\u20b9${currInventory[index].mrp}",
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
          }
        )
      );
    });
    return widgets;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state){
          if(state is InventoryInitialState){
            context.bloc<InventoryBloc>().add(LoadInventory());
          }
          if(state is InventorySuccessState){
            return DefaultTabController(
              length: state.categories.length, 
              child: Scaffold(
                key: _scaffoldKey,
                appBar: AppBar(
                  elevation: 2.0,
                  backgroundColor: Colors.white,
                  centerTitle: false,
                  titleSpacing: 0,
                  
                leading: Container(
                  margin: EdgeInsets.only(top: 2.0),
                  child: IconButton(
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black
                    )
                  ),
                ),
                title: Container(
                  margin: EdgeInsets.only(top: 2.0),
                      child: Text(
                        "Inventory",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18.0
                        ),
                      ),
                    ),
                  bottom: TabBar(
                    isScrollable: true,
                    indicatorWeight: 1.0,
                    indicatorColor: primaryColor,
                    unselectedLabelColor: Colors.grey,
                    labelColor: primaryColor,
                    tabs: categoryBuilder(state.categories)
                  ),
                ),
                body: TabBarView(
                  children: itemBuilder(state.inventory, state.categories)
                ),
                floatingActionButton: SpeedDial(
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
                          }
                        )
                      ),
                    ],
                  ),
                )
              );
            }
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  elevation: 0.0,
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
                ),
              body: Center(
                      child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index){
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              child: ListTile(
                                leading: Shimmer.fromColors(
                                      baseColor: Colors.grey[200],
                                      highlightColor: Colors.grey[100],
                                      child: Container(
                                      width: 48.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.withOpacity(0.5),
                                          width: 0.5
                                        )
                                      )
                                    ),
                                ),
                                title: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      child: Shimmer.fromColors(
                                        baseColor: Colors.grey[200],
                                        highlightColor: Colors.grey[100],
                                        child: Container(
                                          width: double.infinity,
                                          height: 16.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12.0),
                                              color: Colors.white
                                            ),
                                        )
                                      )
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 12.0),
                                      child: Container(
                                      child: Shimmer.fromColors(
                                          baseColor: Colors.grey[200],
                                          highlightColor: Colors.grey[100],
                                          child: Container(
                                            width: double.infinity,
                                            height: 13.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12.0),
                                              color: Colors.white
                                            ),
                                          )
                                        )
                                      ),
                                    )
                                  ],
                                ),
                                trailing: Container(
                                  child: Shimmer.fromColors(
                                      baseColor: Colors.grey[200],
                                      highlightColor: Colors.grey[100],
                                      child: Container(
                                        height: 24,
                                        width: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                            ),
                                      )
                                    )
                                ),
                              )
                            );
                          },
                        )
                    ));
          }
        )
      );
    }
  }