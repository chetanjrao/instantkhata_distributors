class RetailerModel {
  final int id;
  final String name;
  final String mobile;
  final String address;

  RetailerModel(this.id, this.name, this.mobile, this.address);

  static RetailerModel fromJson(dynamic json){
    return RetailerModel(
      json["id"],
      json["name"],
      json["mobile"],
      json["address"]
    );
  }

}