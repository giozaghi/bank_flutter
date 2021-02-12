class OtherInfo {
  String otherAccountName;
  double userLatitude;
  double userLongitude;
  int transactionCategoryId;
  String cupom;

  OtherInfo(
      {this.otherAccountName,
        this.userLatitude,
        this.userLongitude,
        this.transactionCategoryId,
        this.cupom});

  OtherInfo.fromJson(Map<String, dynamic> json) {
    otherAccountName = json['otherAccountName'];
    userLatitude = json['userLatitude'];
    userLongitude = json['userLongitude'];
    transactionCategoryId = json['transactionCategoryId'];
    cupom = json['cupom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otherAccountName'] = this.otherAccountName;
    data['userLatitude'] = this.userLatitude;
    data['userLongitude'] = this.userLongitude;
    data['transactionCategoryId'] = this.transactionCategoryId;
    data['cupom'] = this.cupom;
    return data;
  }
}