import 'package:flutter/material.dart';
import 'package:instantkhata_distributors/main.dart';
import 'package:instantkhata_distributors/ui/features/login/ui/login.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {

  bool hasToken;

  Future<bool> checkToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.containsKey("access_token");
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool value = await checkToken();
      
        Navigator.push(
            context,
           !value ? MaterialPageRoute(
            builder: (_) => Login()
          ) : MaterialPageRoute(
            builder: (_) => MyHomePage()
          )
        );
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 24.0,
        height: 24.0,
        margin: EdgeInsets.symmetric(vertical: 12),
        child: CircularProgressIndicator(
          strokeWidth: 1.2,
          valueColor: AlwaysStoppedAnimation(primaryColor)
        )
      ),
    );
}
}

/**
 * hasToken == null ?  : !hasToken ? Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Login()
        )) : Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MyHomePage()
        ))
 */