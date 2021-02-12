// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statementModule_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StatementModel on StatementModelBase, Store {
  final _$statementAtom = Atom(name: 'StatementModelBase.statement');

  @override
  StatementResponse get statement {
    _$statementAtom.context.enforceReadPolicy(_$statementAtom);
    _$statementAtom.reportObserved();
    return super.statement;
  }

  @override
  set statement(StatementResponse value) {
    _$statementAtom.context.conditionallyRunInAction(() {
      super.statement = value;
      _$statementAtom.reportChanged();
    }, _$statementAtom, name: '${_$statementAtom.name}_set');
  }

  final _$errorAtom = Atom(name: 'StatementModelBase.error');

  @override
  Exception get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(Exception value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$fetchAsyncAction = AsyncAction('fetch');

  @override
  Future fetch(String token, String dataIni, String dataFim) {
    return _$fetchAsyncAction.run(() => super.fetch(token, dataIni, dataFim));
  }
}
