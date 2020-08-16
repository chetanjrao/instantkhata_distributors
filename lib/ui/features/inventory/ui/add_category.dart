import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/category_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/category_event.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/category_state.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_event.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {

  String name = "";

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
                "Add Category",
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
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if(state is CategorySuccessState){
            context.bloc<InventoryBloc>().add(LoadInventory());
          }
        return Flex(
        crossAxisAlignment: CrossAxisAlignment.end,
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.0),
            child: TextField(
              enabled: state is CategoryInitialState,
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
                      labelText: "Category Name",
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
            margin: EdgeInsets.only(top: 24.0, right: 24.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)
              ),
              color: Theme.of(context).primaryColor,
              onPressed: state is CategoryInitialState ? (){
                context.bloc<CategoryBloc>().add(AddCategoryEvent(name));
              } : null,
              child: state is CategoryInitialState ? Text(
                "Add Category",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
                ),
              ) : Container(
                width: 24.0,
                height: 24.0,
                margin: EdgeInsets.symmetric(vertical: 12),
                child: state is CategorySuccessState ? Icon(
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
      );}),
    );
  }
}