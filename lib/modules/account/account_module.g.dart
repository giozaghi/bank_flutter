// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    balance: (json['balance'] as num)?.toDouble(),
    blockedBalance: (json['blockedBalance'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'balance': instance.balance,
      'blockedBalance': instance.blockedBalance,
    };
