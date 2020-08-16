import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/features/salesman/bloc/salesman_bloc.dart';
import 'package:instantkhata_distributors/ui/features/salesman/bloc/salesman_event.dart';
import 'package:instantkhata_distributors/ui/features/salesman/bloc/salesman_state.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Salesman extends StatefulWidget {
  @override
  _SalesmanState createState() => _SalesmanState();
}

class _SalesmanState extends State<Salesman> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Salesman",
            style: TextStyle(
              color: Colors.black
            )
          ),
          titleSpacing: 0,
          leading: Container(
            child: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: Colors.black
              )
            ),
          ),
        ),
        body: Container(
          child: BlocConsumer(
            bloc: BlocProvider.of<SalesmanBloc>(context),
            listener: (context, SalesmanState state){},
            builder: (context, state){
              if(state is SalesmanInitialState){
                  context.bloc<SalesmanBloc>().add(LoadAllSalesman());
              }
              if (state is SalesmanSuccessState){
                  return ListView.builder(
                    itemCount: state.salesman.length,
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
                                      "${state.salesman[index].name}",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600
                                      ),
                                    )
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "${state.salesman[index].mobile}",
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
                                  IconButton(
                                    onPressed: () => launch("tel://${state.salesman[index].mobile}") ,
                                    icon: Icon(
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
                  );
              }
              return ListView.builder(
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
                );
            },
          )
        ),
      ),
    );
  }
}