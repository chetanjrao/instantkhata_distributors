import 'package:equatable/equatable.dart';


class SummaryModel extends Equatable {

  final double balance;
  final List<SummaryInvoiceModel> invoices;
  final SummaryInfoModel retailer;
  final List<SummaryTransactionModel> transactions;

  SummaryModel(this.balance, this.invoices, this.retailer, this.transactions);


  @override
  List<Object> get props => [ balance, invoices, retailer, transactions ];

  static SummaryModel fromJson(dynamic json){
    List<SummaryInvoiceModel> invoices = json["invoices"].map<SummaryInvoiceModel>((e) => SummaryInvoiceModel.fromJson(e)).toList();
    List<SummaryTransactionModel> transactions = json["transactions"].map<SummaryTransactionModel>((e) => SummaryTransactionModel.fromJson(e)).toList();
    SummaryInfoModel summary = SummaryInfoModel.fromJson(json["retailer"]);
    return SummaryModel(
      json["balance"],
      invoices,
      summary,
      transactions
    );
  }

}


class SummaryInfoModel extends Equatable {

  final int id;
  final String name;
  final String logo;
  final String address;
  final String gstNumber;
  final String gstEntity;
  final String gstStateName;
  final String foodLicense;
  final String drugLicense;
  final String firstName;
  final String lastName;

  SummaryInfoModel(this.id, this.name, this.logo, this.address, this.gstNumber, this.gstEntity, this.foodLicense, this.drugLicense, this.firstName, this.lastName, this.gstStateName);

  @override
  List<Object> get props => [ id, name, logo, address, gstNumber, gstEntity, foodLicense, drugLicense, firstName, lastName ];

  static SummaryInfoModel fromJson(dynamic json) => SummaryInfoModel(
    json["id"],
    json["name"],
    json["logo"],
    json["address"],
    json["gst_number"],
    json["gst_entity"],
    json["food_license"],
    json["drug_license"],
    json["user__first_name"],
    json["user__last_name"],
    json["gst_state__name"]
  );

}

class SummaryTransactionModel extends Equatable {

  final int id;
  final double amount;
  final bool isCredit;
  final String paymentImage;
  final DateTime createdAt;
  final String salesman;

  SummaryTransactionModel(this.id, this.amount, this.isCredit, this.paymentImage, this.createdAt, this.salesman);


  @override
  List<Object> get props => [ id, amount, isCredit, paymentImage, createdAt, salesman ];


  static SummaryTransactionModel fromJson(dynamic json) => SummaryTransactionModel(
    json["id"],
    json["amount"],
    json["is_credit"],
    json["payment_image"],
    DateTime.parse(json["created_at"]),
    json["salesman"]
  );

}

class SummaryInvoiceModel extends Equatable {

  final String uid;
  final int id;
  final String salesman;
  final DateTime createdAt;
  final double totalAmount;

  SummaryInvoiceModel(this.uid, this.salesman, this.createdAt, this.totalAmount, this.id);

  @override
  List<Object> get props => [ uid, salesman, createdAt, totalAmount ];

  static SummaryInvoiceModel fromJson(dynamic json) => SummaryInvoiceModel(
    json["uid"],
    json["salesman_name"],
    DateTime.parse(json["created_at"]),
    json["total_amount"],
    json["id"]
  );

}