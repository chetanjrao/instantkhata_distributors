class TransactionModel {
  final int id;
  final double amount;
  final bool isCredit;
  final String image;
  final String retailer;
  final String uid;
  final int invoiceID;
  final double closingBalance;
  final String createdAt;

  TransactionModel(this.id, this.amount, this.isCredit, this.image, this.createdAt, this.retailer, this.uid, this.invoiceID, this.closingBalance);
  
  static TransactionModel fromJson(dynamic json){
    return TransactionModel(
      json["id"],
      json["amount"],
      json["is_credit"],
      json["payment_image"],
      json["created_at"],
      json["retailer"],
      json["uid"],
      json["invoice"],
      json["closing_balance"]
    );
  }
}