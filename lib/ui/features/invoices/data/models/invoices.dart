import 'package:equatable/equatable.dart';

class InvoiceModel extends Equatable {

  final String retailer;
  final String salesman;
  final String uid;
  final double amount;
  final DateTime createdAt;

  InvoiceModel(this.retailer, this.salesman, this.uid, this.amount, this.createdAt);

  @override
  List<Object> get props => [retailer, salesman, uid, amount, createdAt];

  static InvoiceModel fromJson(dynamic json){
    return InvoiceModel(
      json["retailer__name"],
      json["salesman__user__first_name"],
      json["uid"],
      json["total_amount"],
      DateTime.parse(json["created_at"])
    );
  }

}