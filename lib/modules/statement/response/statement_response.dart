import '../statement_module.dart';

class StatementResponse {
  List<Statement> statement;

  StatementResponse({this.statement});


  @override
  String toString() {
    return 'StatementResponse{statement: $statement}';
  }

  StatementResponse.fromJson(Map<String, dynamic> json) {
    if (json['statement'] != null) {
      statement = new List<Statement>();
      json['statement'].forEach((v) {
        statement.add(new Statement.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.statement != null) {
      data['statement'] = this.statement.map((v) => v.toJson()).toList();
    }
    return data;
  }
}