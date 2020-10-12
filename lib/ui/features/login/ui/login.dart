
import 'package:flutter/material.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:shimmer/shimmer.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  List<SimCard> simCards = [];
  bool isLoading = true;
  int choosenIndex = 0;

  @override
  void initState() {
    MobileNumber.hasPhonePermission.then((value) {
      if(!value){
      MobileNumber.requestPhonePermission;
    }});
    MobileNumber.getSimCards.then((value){
      setState((){
        simCards = value;
        isLoading = false;
      });
    }).catchError((onError){
      setState((){
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 96.0,
              width: 96.0,
              child: Image.asset(
                "assets/Vector.png"
              )
            ),
            Container(
              child: isLoading == null || !isLoading ? ListView.builder(
                itemCount: 2,
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
                }
              ) : ListView.builder(
                itemCount: simCards.length,
                itemBuilder: (context, index){
                  return Container();
                }
              ),
            ),
            Container(

            )
          ]
        ),
      )
    );
  }
}