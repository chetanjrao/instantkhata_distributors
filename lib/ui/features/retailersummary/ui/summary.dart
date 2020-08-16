import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/features/details/bloc/details_bloc.dart';
import 'package:instantkhata_distributors/ui/features/details/data/repository/details_repository.dart';
import 'package:instantkhata_distributors/ui/features/details/ui/details.dart';
import 'package:instantkhata_distributors/ui/features/invoices/bloc/invoice_bloc.dart';
import 'package:instantkhata_distributors/ui/features/invoices/data/repository/invoices.dart';
import 'package:instantkhata_distributors/ui/features/invoices/ui/invoice.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/bloc/summary_bloc.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/bloc/summary_event.dart';
import 'package:instantkhata_distributors/ui/features/retailersummary/bloc/summary_state.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class Summary extends StatefulWidget {

  final int retailer;

  const Summary({Key key, @required this.retailer}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> with SingleTickerProviderStateMixin {
  SummaryBloc summaryBloc;
  TabController tabController;
  final InvoiceRepository invoiceRepository = new InvoiceRepository();
  final InvoiceInfoRepository invoiceInfoRepository = new InvoiceInfoRepository();

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void didChangeDependencies(){
    summaryBloc = BlocProvider.of<SummaryBloc>(context);
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    summaryBloc.add(LoadSummary(widget.retailer));
    super.dispose();
  }
  
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, 
      enableDomStorage: true,
      forceSafariVC: true,
      enableJavaScript: true,
      forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
 }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, isoverlap){
          return <Widget>[
            SliverAppBar(
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
                      "Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              ),
            ),
          SliverToBoxAdapter(
            child: Container(
              child: BlocListener(
                bloc: summaryBloc,
                listener: (BuildContext context, state){
                },
                child: BlocBuilder<SummaryBloc, SummaryState>(
             builder: (context, state){
              if(state is SummarySuccessState){
               return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Container(padding: EdgeInsets.all(6.0),
                      height: 64.0,
                      child: state.summary.retailer.logo.length  > 0 ?Image.network(
                        "$API_URL/${state.summary.retailer.logo}"
                      ) : Image.asset(
                        "assets/Vector.png"
                      ),
                    )
                  ),
                  Container(
                    child: Hero(tag: "title${widget.retailer}", child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${state.summary.retailer.name}",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontFamily: 'Axiforma',
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ]
                      )
                    ))
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Text(
                      "Balance: \u20b9${state.summary.balance.toStringAsFixed(2)}"
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Wrap(
                      children: <Widget>[
                        // GestureDetector(
                        //   onTap: (){
                            
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.all(10.0),
                        //     width: 48.0,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.circle,
                        //       border: Border.all(
                        //         color: Colors.grey.withOpacity(0.5),
                        //         width: 0.5
                        //       )
                        //     ),
                        //     child: Center(
                        //       child: Icon(
                        //         Feather.download_cloud,
                        //         color: Theme.of(context).primaryColor,
                        //         size: 20.0
                        //       )
                        //     )
                        //   ),
                        // ),
                        // GestureDetector(
                        //   child: Container(
                        //   padding: EdgeInsets.all(10.0),
                        //   margin: EdgeInsets.only(left: 12.0),
                        //   width: 48.0,
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).primaryColor,
                        //     shape: BoxShape.circle,
                        //     border: Border.all(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       width: 0.5
                        //     )
                        //   ),
                        //   child: Center(
                        //     child: Icon(
                        //         Feather.bell,
                        //         color: Colors.white,
                        //         size: 20.0
                        //     )
                        //   )
                        // ),
                        //   onTap: (){
                        //   },
                        // )
                        // ) : Tooltip(
                        //       message: state.invoiceInfo.invoiceInfo.balance == 0 ? "Paid Completely" : "Notification sent",
                        //       child: Container(
                        //   padding: EdgeInsets.all(10.0),
                        //   margin: EdgeInsets.only(left: 12.0),
                        //   width: 48.0,
                        //   decoration: BoxDecoration(
                        //     color: Theme.of(context).primaryColor,
                        //     shape: BoxShape.circle,
                        //     border: Border.all(
                        //       color: Colors.grey.withOpacity(0.5),
                        //       width: 0.5
                        //     )
                        //   ),
                        //   child: Center(
                        //     child: Icon(
                        //         Feather.check,
                        //         color: Colors.white,
                        //         size: 20.0
                        //     )
                        //   )
                        // ),
                        // )
                      ],
                    )
                  )
                ],
              );
              } else {
                return Container();
              }
             },
           )))),
            SliverPersistentHeader(
              delegate: SliverHeaderDelegate(
                tabController: tabController
              ),
              floating: true,
              pinned: true,
            )
          ];
        }, 
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            BlocBuilder<SummaryBloc, SummaryState>(
              builder: (context, state){
                if(state is SummaryInitialState){
                  summaryBloc.add(LoadSummary(widget.retailer));
                }
                if(state is SummarySuccessState){
                  return ListView.builder(
              itemCount: state.summary.invoices.length,
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: ListTile(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => MultiBlocProvider(
                                    providers: [
                                      BlocProvider(
                                        create: (context) => InvoiceBloc(
                                          invoiceRepository
                                        ),
                                      ),
                                      BlocProvider(
                                        create: (context) => InvoiceDetailsBloc(
                                          invoiceInfoRepository: invoiceInfoRepository
                                        ),
                                      ),
                                    ],
                                    child: Details(invoiceID: state.summary.invoices[index].uid)
                                  ),            
                              ));
                            },
                            leading: Container(
                              width: 48.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 0.5
                                )
                              ),
                              child: Center(
                                child: Icon(
                                  Feather.file,
                                  color: Colors.red,
                                  size: 20.0,
                                )
                              )
                            ),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "${state.summary.invoices[index].salesman}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15.0
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    "${DateFormat.jm().format(state.summary.invoices[index].createdAt.toLocal())} ${DateFormat.yMMMM('en_US').format(state.summary.invoices[index].createdAt.toLocal())}",
                                    style: TextStyle(
                                      color: Color(0XFF404864),
                                      fontSize: 13.0
                                    ),
                                  ),
                                )
                              ],
                            ),
                            trailing: Container(
                              child: Text(
                                "\u20b9 ${state.summary.invoices[index].totalAmount.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Color(0XFF131B26),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0
                                )
                              )
                            ),
                          )
                );
              },
            );
                } else {
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
                }
                  
              },
            ),
             BlocBuilder<SummaryBloc, SummaryState>(
              builder: (context, state){
                if(state is SummaryInitialState){
                  summaryBloc.add(LoadSummary(widget.retailer));
                }
                if(state is SummarySuccessState){
                  return ListView.builder(
              itemCount: state.summary.transactions.length,
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: ListTile(
                            onTap: (){
                            },
                            leading: Container(
                            width: 48.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 0.5
                              )
                            ), 
                          child: Center(
                            child: Container(padding: EdgeInsets.all(6.0),
                              height: 48.0,
                             child: Image.network(
                               "$API_URL/uploads/${state.summary.transactions[index].paymentImage}"
                             ),
                        )
                          )
                        ),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "${state.summary.transactions[index].salesman}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15.0
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    "${DateFormat.jm().format(state.summary.transactions[index].createdAt.toLocal())} ${DateFormat.yMMMM('en_US').format(state.summary.transactions[index].createdAt.toLocal())}",
                                    style: TextStyle(
                                      color: Color(0XFF404864),
                                      fontSize: 13.0
                                    ),
                                  ),
                                )
                              ],
                            ),
                            trailing: Container(
                              child: Text(
                                "\u20b9 ${state.summary.transactions[index].amount.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: Color(0XFF131B26),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0
                                )
                              )
                            ),
                          )
                );
              },
            );
                } else {
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
                }
                  
              },
            )
          ],
        )
      )
    )
    );
  }
}

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
    final TabController tabController;

    const SliverHeaderDelegate({Key key, @required this.tabController}) : super();

    @override
    Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
      return Material(
        elevation: 0,
        color: Colors.white,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          indicatorColor: Theme.of(context).primaryColor,
          labelColor: Theme.of(context).primaryColor,
          indicatorWeight: 1.0,
          unselectedLabelColor: Color(0XFF404864),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Axiforma'
          ),
          tabs: <Widget>[
            Tab(
              text: "Invoices",
            ),
            Tab(
              text: "Transactions",
            )
          ],
        ),
      );
    }
  
    @override
    double get maxExtent => 40.0;
  
    @override
    double get minExtent => 40.0;

    @override
    bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
      return true;
    }
  
  
}
