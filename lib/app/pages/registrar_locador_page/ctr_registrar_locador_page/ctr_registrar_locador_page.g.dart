// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ctr_registrar_locador_page.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CtrRegistrarLocadorPage on _CtrRegistrarLocadorPageBase, Store {
  Computed<bool>? _$isShowContinueParte1Computed;

  @override
  bool get isShowContinueParte1 => (_$isShowContinueParte1Computed ??=
          Computed<bool>(() => super.isShowContinueParte1,
              name: '_CtrRegistrarLocadorPageBase.isShowContinueParte1'))
      .value;

  late final _$formFieldParte1Atom = Atom(
      name: '_CtrRegistrarLocadorPageBase.formFieldParte1', context: context);

  @override
  GlobalKey<FormState> get formFieldParte1 {
    _$formFieldParte1Atom.reportRead();
    return super.formFieldParte1;
  }

  @override
  set formFieldParte1(GlobalKey<FormState> value) {
    _$formFieldParte1Atom.reportWrite(value, super.formFieldParte1, () {
      super.formFieldParte1 = value;
    });
  }

  late final _$keyScaffoldAtom =
      Atom(name: '_CtrRegistrarLocadorPageBase.keyScaffold', context: context);

  @override
  GlobalKey<ScaffoldState> get keyScaffold {
    _$keyScaffoldAtom.reportRead();
    return super.keyScaffold;
  }

  @override
  set keyScaffold(GlobalKey<ScaffoldState> value) {
    _$keyScaffoldAtom.reportWrite(value, super.keyScaffold, () {
      super.keyScaffold = value;
    });
  }

  late final _$ctrTextNomeAtom =
      Atom(name: '_CtrRegistrarLocadorPageBase.ctrTextNome', context: context);

  @override
  TextEditingController get ctrTextNome {
    _$ctrTextNomeAtom.reportRead();
    return super.ctrTextNome;
  }

  @override
  set ctrTextNome(TextEditingController value) {
    _$ctrTextNomeAtom.reportWrite(value, super.ctrTextNome, () {
      super.ctrTextNome = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CtrRegistrarLocadorPageBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$ctrTextSenhaAtom =
      Atom(name: '_CtrRegistrarLocadorPageBase.ctrTextSenha', context: context);

  @override
  TextEditingController get ctrTextSenha {
    _$ctrTextSenhaAtom.reportRead();
    return super.ctrTextSenha;
  }

  @override
  set ctrTextSenha(TextEditingController value) {
    _$ctrTextSenhaAtom.reportWrite(value, super.ctrTextSenha, () {
      super.ctrTextSenha = value;
    });
  }

  late final _$obscureSenhaAtom =
      Atom(name: '_CtrRegistrarLocadorPageBase.obscureSenha', context: context);

  @override
  bool get obscureSenha {
    _$obscureSenhaAtom.reportRead();
    return super.obscureSenha;
  }

  @override
  set obscureSenha(bool value) {
    _$obscureSenhaAtom.reportWrite(value, super.obscureSenha, () {
      super.obscureSenha = value;
    });
  }

  late final _$ctrTextContatoAtom = Atom(
      name: '_CtrRegistrarLocadorPageBase.ctrTextContato', context: context);

  @override
  TextEditingController get ctrTextContato {
    _$ctrTextContatoAtom.reportRead();
    return super.ctrTextContato;
  }

  @override
  set ctrTextContato(TextEditingController value) {
    _$ctrTextContatoAtom.reportWrite(value, super.ctrTextContato, () {
      super.ctrTextContato = value;
    });
  }

  late final _$onTapContinueAsyncAction = AsyncAction(
      '_CtrRegistrarLocadorPageBase.onTapContinue',
      context: context);

  @override
  Future onTapContinue() {
    return _$onTapContinueAsyncAction.run(() => super.onTapContinue());
  }

  late final _$_CtrRegistrarLocadorPageBaseActionController =
      ActionController(name: '_CtrRegistrarLocadorPageBase', context: context);

  @override
  dynamic _setLoading(bool value) {
    final _$actionInfo = _$_CtrRegistrarLocadorPageBaseActionController
        .startAction(name: '_CtrRegistrarLocadorPageBase._setLoading');
    try {
      return super._setLoading(value);
    } finally {
      _$_CtrRegistrarLocadorPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _setObscureSenha() {
    final _$actionInfo = _$_CtrRegistrarLocadorPageBaseActionController
        .startAction(name: '_CtrRegistrarLocadorPageBase._setObscureSenha');
    try {
      return super._setObscureSenha();
    } finally {
      _$_CtrRegistrarLocadorPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapIconSenha() {
    final _$actionInfo = _$_CtrRegistrarLocadorPageBaseActionController
        .startAction(name: '_CtrRegistrarLocadorPageBase.onTapIconSenha');
    try {
      return super.onTapIconSenha();
    } finally {
      _$_CtrRegistrarLocadorPageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formFieldParte1: ${formFieldParte1},
keyScaffold: ${keyScaffold},
ctrTextNome: ${ctrTextNome},
loading: ${loading},
ctrTextSenha: ${ctrTextSenha},
obscureSenha: ${obscureSenha},
ctrTextContato: ${ctrTextContato},
isShowContinueParte1: ${isShowContinueParte1}
    ''';
  }
}