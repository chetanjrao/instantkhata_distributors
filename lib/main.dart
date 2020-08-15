import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/features/dashboard/ui/dashboard.dart';
import 'package:instantkhata_distributors/ui/features/inventory/bloc/inventory_bloc.dart';
import 'package:instantkhata_distributors/ui/features/inventory/data/repository/inventory.dart';
import 'package:instantkhata_distributors/ui/features/inventory/ui/inventory.dart';
import 'package:instantkhata_distributors/ui/features/invoices/bloc/invoice_bloc.dart';
import 'package:instantkhata_distributors/ui/features/invoices/data/repository/invoices.dart';
import 'package:instantkhata_distributors/ui/features/invoices/ui/invoice.dart';
import 'package:instantkhata_distributors/ui/features/notifications/ui/notifications.dart';
import 'package:instantkhata_distributors/ui/features/ledger.dart';
import 'package:instantkhata_distributors/ui/features/sales.dart';
import 'package:instantkhata_distributors/ui/features/users.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white.withOpacity(1)
  ));
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
  final InventoryRepository inventoryRepository = new InventoryRepository();
  final InvoiceRepository invoiceRepository = new InvoiceRepository();
  List<String> titles = ["Statistics", "Inventory", "Transactions", "Invoices", "Retailers", "Salesman", "Profile", "About the app", "Report", "Feedback", "Sign Out"];
  List<IconData> icons = [
    Feather.trending_up,
    Feather.inbox,
    Feather.repeat,
    Feather.file,
    Feather.briefcase,
    Feather.users,
    Feather.zap,
    Feather.info,
    Feather.alert_triangle,
    Feather.rss,
    Feather.log_out
  ];

  void _onTapped(index){
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                ListTile(
                  isThreeLine: false,
                  title: Container(
                    padding: EdgeInsets.only(
                      top: 12,
                      left: 8
                    ),
                    child: Text(
                      "InstantKhata",
                      style: TextStyle(
                        color: Color(0xFFD44638),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ),
                Divider(),
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(right: 16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(48),
                            bottomRight: Radius.circular(48)
                          ),
                          color: currentPage == index ? Theme.of(context).primaryColor.withOpacity(0.13) : Colors.transparent
                        ),
                        child: ListTile(
                          leading: Container(
                            child: Icon(
                              icons[index],
                              size: 20,
                              color: currentPage == index ? Theme.of(context).primaryColor : Color(0xFF464646)
                            ),
                          ),
                          title: Container(
                            child: Align(
                              child: Text(
                                titles[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: currentPage == index ? Theme.of(context).primaryColor : Color(0xFF464646),
                                  fontSize: 15.0
                                ),
                              ),
                              alignment: Alignment(-1.2, 0),
                            ),
                          ),
                          onTap: (){
                            _onTapped(index);
                            Navigator.of(context).pop();
                          },
                        )
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ),
        body: IndexedStack(
          index: currentPage,
          children: <Widget>[
            Dashboard(),
            BlocProvider(
              create: (context) => InventoryBloc(
                inventoryRepository
              ),
              child: Inventory()
            ),
            Sales(),
            BlocProvider(
              create: (context) => InvoiceBloc(
                invoiceRepository
              ),
              child: Invoice()
            ),
            Users()
          ],
        ),
        
      )
    );
  }
}
