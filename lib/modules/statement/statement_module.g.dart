// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statement _$StatementFromJson(Map<String, dynamic> json) {
  return Statement(
    id: json['id'] as int,
    accountName: json['accountName'] as String,
    amount: json['amount'] as int,
    balance: json['balance'] as int,
    createdAt: json['createdAt'] as String,
    operationType: json['operationType'] as String,
    status: json['status'] as String,
  )..otherInfo = json['otherInfo'] == null
      ? null
      : OtherInfo.fromJson(json['otherInfo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$StatementToJson(Statement instance) => <String, dynamic>{
      'id': instance.id,
      'accountName': instance.accountName,
      'amount': instance.amount,
      'balance': instance.balance,
      'createdAt': instance.createdAt,
      'operationType': instance.operationType,
      'status': instance.status,
      'otherInfo': instance.otherInfo,
    };
