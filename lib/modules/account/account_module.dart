import 'package:json_annotation/json_annotation.dart';

part 'account_module.g.dart';

@JsonSerializable()
class Account{
  double balance;
  double blockedBalance;

  Account({this.balance, this.blockedBalance});


  @override
  String toString() {
    return 'Account{balance: $balance, blockedBalance: $blockedBalance}';
  }

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}