
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Statistics extends Equatable {
  final double status;
  final double total;

  Statistics({@required this.status,@required this.total});

  @override
  List<Object> get props => [status, total];

  static Statistics fromJson(dynamic json){
    return Statistics(
      status: double.parse("${json["status"]}"),
      total: double.parse("${json["total"]}")
    );
  }

}

class RecentTransactions extends Equatable {
  final int id;
  final double amount;
  final bool isCredit;
  final String image;
  final String createdAt;

  RecentTransactions({
    @required this.id,
    @required this.amount,
    @required this.image,
    @required this.isCredit,
    @required this.createdAt
  });

  @override
  List<Object> get props => [id, amount, isCredit, createdAt];

  static RecentTransactions fromJson(dynamic json){
    return RecentTransactions(
      id: json["id"],
      amount: json["amount"],
      isCredit: json["is_credit"],
      image: json["image"],
      createdAt: json["created_at"]
    );
  }

}

class SingleInvoice extends Equatable {
  final String uid;
  final DateTime createdAt;
  final String retailer;
  final double amount;

  SingleInvoice({this.uid, this.retailer, this.amount, this.createdAt});

  @override
  List<Object> get props => [ uid, retailer, amount, createdAt ];

  static SingleInvoice fromJson(dynamic json){
    return SingleInvoice(
      uid: json["uid"],
      retailer: json["retailer__name"],
      amount: json["total_amount"],
      createdAt: DateTime.parse(json["created_at"])
    );
  }

}