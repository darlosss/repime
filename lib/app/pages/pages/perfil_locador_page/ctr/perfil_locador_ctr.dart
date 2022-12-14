import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:repime/app/blocs/vaga/db/vaga_db.dart';
import 'package:repime/app/blocs/vaga/vaga.dart';
import 'package:repime/app/pages/controller/main_controller.dart';

import '../../../../blocs/locador/db/locador_db.dart';
import '../../../../blocs/locador/locador.dart';
part 'perfil_locador_ctr.g.dart';

class PerfilLocadorCtr = _PerfilLocadorCtrBase with _$PerfilLocadorCtr;

abstract class _PerfilLocadorCtrBase with Store {
  _PerfilLocadorCtrBase();

  @observable
  var vagas = ObservableList<Vaga>();

  @action
  void setVagas(List<Vaga> value) => vagas = value.asObservable();

  @observable
  var ctrContato = TextEditingController();

  @action
  void setContato(String value) => ctrContato.text = value;

  @observable
  bool loading = false;

  @action
  void _setLoading(bool value) => loading = value;

  @action
  Future<void> deleteVaga(Vaga v) async {
    _setLoading(true);
    await VagaDB.deleteVaga(v.id);
    _setLoading(false);
    vagas.removeWhere((e) => e.id == v.id);
  }

  @action
  Future<void> onTapDeslogar() async {
    _setLoading(true);
    var mainController = Modular.get<MainController>();
    await LocadorDB.toDB(mainController.locadorAtual).deleteCache();
    mainController.setLocadorAtual(Locador.zero);
    Modular.to.pop();
    _setLoading(false);
  }
}
