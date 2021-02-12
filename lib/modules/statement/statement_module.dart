import 'package:json_annotation/json_annotation.dart';

import 'otherInfo_module.dart';

part 'statement_module.g.dart';

@JsonSerializable()
class Statement{

  int id;
  String accountName;
  int amount;
  int balance;
  String createdAt;
  String operationType;
  String status;
  OtherInfo otherInfo;

  Statement({this.id, this.accountName, this.amount, this.balance,
      this.createdAt, this.operationType, this.status});

  factory Statement.fromJson(Map<String, dynamic> json) => _$StatementFromJson(json);

  Map<String, dynamic> toJson() => _$StatementToJson(this);

  @override
  String toString() {
    return 'Statement{id: $id, accountName: $accountName, amount: $amount, balance: $balance, createdAt: $createdAt, operationType: $operationType, status: $status}';
  }
}