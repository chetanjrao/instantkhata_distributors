import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instantkhata_distributors/ui/features/details/bloc/details_bloc.dart';
import 'package:instantkhata_distributors/ui/features/details/data/repository/details_repository.dart';
import 'package:instantkhata_distributors/ui/features/details/ui/details.dart';
import 'package:instantkhata_distributors/ui/features/invoices/bloc/invoice_bloc.dart';
import 'package:instantkhata_distributors/ui/features/invoices/data/repository/invoices.dart';
import 'package:instantkhata_distributors/ui/features/statistics/bloc/statistics_bloc.dart';
import 'package:instantkhata_distributors/ui/features/statistics/bloc/statistics_events.dart';
import 'package:instantkhata_distributors/ui/features/statistics/bloc/statistics_state.dart';
import 'package:instantkhata_distributors/ui/features/statistics/data/models/statistics_models.dart';
import 'package:instantkhata_distributors/ui/utils/constants.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class Statistics extends StatefulWidget {

  final int salesman;

  const Statistics({Key key,@required this.salesman}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> with SingleTickerProviderStateMixin {

  TabController tabController;
  final InvoiceRepository invoiceRepository = new InvoiceRepository();
  final InvoiceInfoRepository invoiceInfoRepository = new InvoiceInfoRepository();

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Statistics",
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
              child: BlocBuilder<StatisticsBloc, StatisticsState>(
                builder: (context, state){
                  if(state is StatisticsInitial){
                    context.bloc<StatisticsBloc>().add(FetchStatistics(
                      salesman: widget.salesman
                    ));
                    context.bloc<StatisticsBloc>().add(FetchRecentTransactions(
                      salesman: widget.salesman
                    ));
                  }
                  if(state is StatisticsSuccess){
                return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\u20b9",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontFamily: 'Axiforma',
                              fontWeight: FontWeight.w500
                            )
                          ),
                          TextSpan(
                            text: "${state.statistics.total.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 32.0,
                              color: Colors.black,
                              fontFamily: 'Axiforma',
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ]
                      )
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.0),
                    child: Wrap(
                      children: <Widget>[
                        Container(
                          child: Text(
                            state.statistics.status < 0 ? "${state.statistics.status.toStringAsFixed(2)} %" : "+ ${state.statistics.status.toStringAsFixed(2)} %",
                            style: TextStyle(
                              color: state.statistics.status < 0 ? Colors.red : Color(0XFF0EA581)
                            ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4.0, top: 1.0),
                          child: Icon(
                            state.statistics.status < 0 ? Feather.trending_down : Feather.trending_up,
                            color: state.statistics.status < 0 ? Colors.red : Color(0XFF0EA581),
                            size: 16.0,
                          )
                        )
                      ],
                    )
                  )
                ],
              );
                  } else {
                    return Container();
                  }
                },
              )
            ),
            SliverPersistentHeader(
              delegate: SliverHeaderDelegate(
                tabController: tabController
              ),
              floating: true,
              pinned: true,
            )
          ];
        }, 
        body: BlocBuilder<StatisticsBloc, StatisticsState>(
          builder: (context, state){
            if(state is StatisticsSuccess){
              List<RecentTransactions> allTransactions = state.transactions;
              List<RecentTransactions> creditTransactions = state.transactions.where((element) => element.isCredit).toList();
              List<RecentTransactions> debitTransactions = state.transactions.where((element) => !element.isCredit).toList();
            return TabBarView(
              controller: tabController,
              children: <Widget>[
                Container(
                  child: ListView.builder(
              padding: EdgeInsets.zero,
                  itemCount: state.invoices.length,
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
                                    child: Details(invoiceID: state.invoices[index].uid)
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
                                    "${state.invoices[index].retailer}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 15.0
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 6.0),
                                  child: Text(
                                    "${DateFormat.jm().format(state.invoices[index].createdAt.toLocal())} ${DateFormat.yMMMM('en_US').format(state.invoices[index].createdAt.toLocal())}",
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
                                "\u20b9 ${state.invoices[index].amount.toStringAsFixed(2)}",
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
                )
                ),
                ListView.builder(
              padding: EdgeInsets.zero,
                  itemCount: allTransactions.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: ListTile(
                        leading:Container(
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
                               "$API_URL${allTransactions[index].image}"
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
                                allTransactions[index].isCredit ? "Credit" : "Debit",
                                style: TextStyle(
                                  fontSize: 15.0
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.0),
                              child: Text(
                                "${DateFormat.jm().format(DateTime.parse(state.transactions[index].createdAt).toLocal())} ${DateFormat.yMMMMd('en_US').format(DateTime.parse(state.transactions[index].createdAt).toLocal())} ",
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
                            allTransactions[index].isCredit ? "+\u20b9${state.transactions[index].amount.toStringAsFixed(2)}": "\u20b9${state.transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: allTransactions[index].isCredit ? Color(0XFF0EA581) : Color(0XFF131B26),
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0
                            )
                          )
                        ),
                      )
                    );
                  },
                ),
                ListView.builder(
              padding: EdgeInsets.zero,
                  itemCount: creditTransactions.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: ListTile(
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
                               "$API_URL${allTransactions[index].image}"
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
                                creditTransactions[index].isCredit ? "Credit" : "Debit",
                                style: TextStyle(
                                  fontSize: 15.0
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.0),
                              child: Text(
                                "${DateFormat.jm().format(DateTime.parse(creditTransactions[index].createdAt).toLocal())} ${DateFormat.yMMMMd('en_US').format(DateTime.parse(creditTransactions[index].createdAt).toLocal())} ",
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
                            creditTransactions[index].isCredit ? "+\u20b9${creditTransactions[index].amount.toStringAsFixed(2) }": "\u20b9${creditTransactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: creditTransactions[index].isCredit ? Color(0XFF0EA581) : Color(0XFF131B26),
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0
                            )
                          )
                        ),
                      )
                    );
                  },
                ),
                ListView.builder(
              padding: EdgeInsets.zero,
                  itemCount: debitTransactions.length,
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: ListTile(
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
                               "$API_URL${allTransactions[index].image}"
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
                                debitTransactions[index].isCredit ? "Credit" : "Debit",
                                style: TextStyle(
                                  fontSize: 15.0
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6.0),
                              child: Text(
                                "${DateFormat.jm().format(DateTime.parse(debitTransactions[index].createdAt).toLocal())} ${DateFormat.yMMMMd('en_US').format(DateTime.parse(debitTransactions[index].createdAt).toLocal())} ",
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
                            debitTransactions[index].isCredit ? "+\u20b9${state.transactions[index].amount.toStringAsFixed(2)}": "\u20b9${state.transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: debitTransactions[index].isCredit ? Color(0XFF0EA581) : Color(0XFF131B26),
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0
                            )
                          )
                        ),
                      )
                    );
                  },
                )
              ],
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.zero,
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
          }
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
              text: "Invoices"
            ),
            Tab(
              text: "All",
            ),
            Tab(
              text: "Credits",
            ),
            Tab(
              text: "Debits",
            ),
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
