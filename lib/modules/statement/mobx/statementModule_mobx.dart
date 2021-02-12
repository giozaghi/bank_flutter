import 'package:bank_flutter/controller/statement_controller.dart';
import 'package:bank_flutter/modules/statement/response/statement_response.dart';
import 'package:mobx/mobx.dart';

import '../statement_module.dart';

part 'statementModule_mobx.g.dart';

class StatementModel = StatementModelBase with _$StatementModel;

abstract class StatementModelBase with Store {

  @observable
  StatementResponse statement;

  @observable
  Exception error;

  @action
  fetch(String token, String dataIni, String dataFim) async {
  try{
  this.statement = await StatementController.statement(token, dataIni, dataFim);

  }catch(e){
  error = e;
  }
  }

}