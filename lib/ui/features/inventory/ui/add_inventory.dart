import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/addinventory_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/addinventory_event.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/addinventory_state.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_event.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_state.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/models/inventory.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class AddInventory extends StatefulWidget {
  @override
  _AddInventoryState createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {

  String name;
  double mrp;
  String hsn;
  double basePrice;
  int type;
  int quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Feather.chevron_left,
            color: Theme.of(context).primaryColor
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Text(
                "Add Inventory",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500
                ),
              ),
            )
          ],
        ),
      ),
      body: BlocBuilder<AddInventoryBloc, AddInventoryState>(
        builder: (context, state) {
          InventoryState inventoryState = context.bloc<InventoryBloc>().state;
          List<CategoryModel> categories = List<CategoryModel>.from((inventoryState as InventorySuccessState).categories).toList();
          if(state is AddInventorySuccessState){
            context.bloc<InventoryBloc>().add(LoadInventory());
          }
        return SingleChildScrollView(
          child: Flex(
        crossAxisAlignment: CrossAxisAlignment.end,
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              enabled: state is AddInventoryInitialState,
                    onChanged: (val){
                      setState((){
                        name = val;
                      });
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                        width: 0.3,
                        color: Color(0xFF404864)
                        )),
                        focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          width: 0.3,
                          color: Color(0xFF404864)
                      )),
                      focusColor: Color(0xFF404864),
                      labelText: "Name",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF404864)
                      ),
                      hintStyle: TextStyle(
                        height: 2,
                        color: Color(0xFF404864)
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 16.0, top: 12.0, bottom: 8.0),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              enabled: state is AddInventoryInitialState,
                    onChanged: (val){
                      setState((){
                        mrp = double.parse(val);
                      });
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                        width: 0.3,
                        color: Color(0xFF404864)
                        )),
                        focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          width: 0.3,
                          color: Color(0xFF404864)
                      )),
                      focusColor: Color(0xFF404864),
                      labelText: "MRP",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF404864)
                      ),
                      hintStyle: TextStyle(
                        height: 2,
                        color: Color(0xFF404864)
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 16.0, top: 12.0, bottom: 8.0),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              enabled: state is AddInventoryInitialState,
                    onChanged: (val){
                      setState((){
                        hsn = val;
                      });
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                        width: 0.3,
                        color: Color(0xFF404864)
                        )),
                        focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          width: 0.3,
                          color: Color(0xFF404864)
                      )),
                      focusColor: Color(0xFF404864),
                      labelText: "HSN",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF404864)
                      ),
                      hintStyle: TextStyle(
                        height: 2,
                        color: Color(0xFF404864)
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 16.0, top: 12.0, bottom: 8.0),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              enabled: state is AddInventoryInitialState,
                    onChanged: (val){
                      setState((){
                        basePrice = double.parse(val);
                      });
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                        width: 0.3,
                        color: Color(0xFF404864)
                        )),
                        focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          width: 0.3,
                          color: Color(0xFF404864)
                      )),
                      focusColor: Color(0xFF404864),
                      labelText: "Base Price",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF404864)
                      ),
                      hintStyle: TextStyle(
                        height: 2,
                        color: Color(0xFF404864)
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 16.0, top: 12.0, bottom: 8.0),
                    ),
                  ),
          ),
          Container(
            alignment: Alignment.centerLeft,
             margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            padding: EdgeInsets.only(left: 0.0, right: 16.0, top: 12.0, bottom: 8.0),
            child: DropdownButton(
              elevation: 2,
              hint: Text("Item Type"),
              value: type,
              items: categories.map<DropdownMenuItem>((e) => DropdownMenuItem(
                  child: Container(
                    
                    child: Text("${e.name}")
                  ),
                  value: e.id,
                )).toList(),
              onChanged: (value) {
                setState(() {
                  type = value;
                });
              }),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              enabled: state is AddInventoryInitialState,
                    onChanged: (val){
                      setState((){
                        quantity = int.parse(val);
                      });
                    },
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                        width: 0.3,
                        color: Color(0xFF404864)
                        )),
                        focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(
                          width: 0.3,
                          color: Color(0xFF404864)
                      )),
                      focusColor: Color(0xFF404864),
                      labelText: "Quantity",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF404864)
                      ),
                      hintStyle: TextStyle(
                        height: 2,
                        color: Color(0xFF404864)
                      ),
                      contentPadding: EdgeInsets.only(left: 0.0, right: 16.0, top: 12.0, bottom: 8.0),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24.0, right: 24.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)
              ),
              color: Theme.of(context).primaryColor,
              onPressed: state is AddInventoryInitialState ? (){
                context.bloc<AddInventoryBloc>().add(AddNewInventoryEvent(name, mrp, hsn, basePrice, type, quantity));
              } : null,
              child: state is AddInventoryInitialState ? Text(
                "Add Inventory",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ) : Container(
                width: 24.0,
                height: 24.0,
                margin: EdgeInsets.symmetric(vertical: 12),
                child: state is AddInventorySuccessState ? Icon(
                  Icons.check_circle,
                  size: 28.0,
                  color: Color(0xFF1e7145)
                ) : CircularProgressIndicator(
                  strokeWidth: 1.2,
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                )
              )
            )
          )
        ],
      ));}),
    );
  }
}