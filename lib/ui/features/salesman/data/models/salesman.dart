class SalesmanModel {
  final int id;
  final String name;
  final String mobile;

  SalesmanModel(this.id, this.name, this.mobile);

  static SalesmanModel fromJson(dynamic json){
    return SalesmanModel(
      json["id"],
      json["name"],
      json["mobile"]
    );
  }

}