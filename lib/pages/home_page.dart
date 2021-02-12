import 'dart:async';

import 'package:bank_flutter/controller/account_controller.dart';
import 'package:bank_flutter/helpers/sharedPrefs/sharedPrefs_helper.dart';
import 'package:bank_flutter/modules/account/account_module.dart';
import 'package:bank_flutter/modules/statement/mobx/statementModule_mobx.dart';
import 'package:bank_flutter/modules/statement/response/statement_response.dart';
import 'package:bank_flutter/modules/statement/statement_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<double> balance;
  SharedPref sharedPref = SharedPref();
  String token = '';
  Future<Account> c;
  final _dataIni = new MaskedTextController(mask: '0000-00-00');
  final _dataFim = new MaskedTextController(mask: '0000-00-00');
  final _money = new MoneyMaskedTextController(precision: 2);
  final _model = StatementModel();
  NumberFormat formatter = NumberFormat("00.00");
  


  loadSharedPrefs() async {
    try {
      token = await sharedPref.read("token");
      print('TOKEN $token');
      setState(() {

      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saldo'),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Saldo ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

              ],
            ),
            FutureBuilder(
              future: AccountController.balance(token),
              builder: (context, snapshot) {
                Account c = snapshot.data;
                //c.balance != null ? _money.updateValue(c.balance) : _money.updateValue(00.00);
                return c != null
                    ? Center(child: Text(r'R$ ' + '${formatter.format(c.balance)}',style: TextStyle(fontSize: 18),))
                    : Center(
                  child: Text("00,00"),
                );
              },
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Text(
                      'Extrato : ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _dataIni,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: 'De :'),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _dataFim,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: 'Até : '),
                      ),
                    ),
                  ],
                ))
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              child: Container(
                width: 150,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.white)),
                    textColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text(
                        'Pesquisar',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    color: Colors.lightBlueAccent,
                    onPressed: () async {

                      _model.fetch(token, _dataIni.text, _dataFim.text);
                    }),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Observer(builder: (_) {
              StatementResponse statementList = _model.statement;
              print("MODEL ${_model.statement}");

              if (_model.error != null) {
                return Text("Não foi possivel realizar a pesquisa");
              }


              if (statementList == null) {
                return Center(
                  child: Text('Não há dados para Extrato! '),
                );
              }
              return _listView(statementList);
              ;
            }),

          ],
        ),
      ),
    );
  }

  _listView(StatementResponse statementList) {
    return Container(
      child: Flexible(
        child: ListView.builder(
            
          itemCount: statementList.statement.length,
            itemBuilder: (context,index){
            Statement st = statementList.statement[index];
            if(st.operationType == 'RECEIVED_TRANSFERENCE'){
              st.operationType = 'Transferência recebida';
            }
            if(st.operationType == 'SENT_TRANSFERENCE'){
              st.operationType = 'Transferência enviada';
            }
            if(st.operationType == 'BANK_SLIP_PAYMENT'){
              st.operationType = 'Pagamento de boleto';
            }
            if(st.operationType == 'BANK_SLIP_DEPOSIT'){
              st.operationType = 'depósito de boleto bancário';
            }
            if(st.operationType == 'BANK_DEPOSIT'){
              st.operationType = 'Depósito';
            }
            return Column(
              children: [
                Text("${st.createdAt.substring(0,10)}  ${st.operationType} " + r'R$'+ " ${formatter.format(st.amount)}",style: TextStyle(fontSize: 15),),


                new SizedBox(
                  height: 5.0,
                  child: new Center(
                    child: new Container(
                      margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                      height: 1.0,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            );
            }
        ),
      ),
    );
  }
}
