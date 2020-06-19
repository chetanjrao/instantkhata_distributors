import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/screens/dashboard.dart';
import 'package:instantkhata_distributors/ui/screens/inventory.dart';
import 'package:instantkhata_distributors/ui/screens/notifications.dart';
import 'package:instantkhata_distributors/ui/screens/ledger.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstantKhata Distributors',
      theme: ThemeData(
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Axiforma',
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  Widget _buildWidget(index) {
    switch(index){
      case 0:
        return Dashboard();
      case 1:
        return Inventory();
      case 2:
        return Text("Reports");
      case 3:
        return Ledger();
      case 4:
        return Text("Profile");
      default:
        return Dashboard();
    }
  }

  void _onTapped(index){
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidget(currentPage),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        currentIndex: currentPage,
        selectedItemColor: primaryColor,
        unselectedItemColor: Color(0xFF999999),
        type: BottomNavigationBarType.fixed,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Feather.pie_chart,
              size: 21.0,
              ),
            title: Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.shopping_bag,
              size: 21.0,
              ),
            title: Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.file_text,
              size: 21.0,
              ),
            title: Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.book,
              size: 21.0,
              ),
            title: Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor
              ),
            )
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Feather.users,
              size: 21.0,
              ),
            title: Container(
              margin: EdgeInsets.only(top: 5.0),
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primaryColor
              ),
            )
          ),
        ],
      )
    );
  }
}
