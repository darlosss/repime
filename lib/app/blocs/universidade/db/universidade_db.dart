import 'package:repime/app/blocs/cidade/cidade.dart';
import 'package:repime/app/blocs/universidade/universidade.dart';

import '../../connection_database/connection_database.dart';

class UniversidadeDB extends Universidade {
  UniversidadeDB({required super.id, required super.idCidade, required super.nome});

  static Future<List<UniversidadeDB>> getUniversidades(Cidade c) async {
    var universidades = <UniversidadeDB>[];
    var result = await ConnectionDataBase().make(QueryDataBase(
        commandSQL: "SELECT * FROM universidade WHERE id_cidade = @city", arguments: {'city': c.id}));
    for (var r in result) {
      universidades.add(UniversidadeDB.fromJson(r));
    }
    return universidades;
  }

  factory UniversidadeDB.fromJson(j) => UniversidadeDB(
      id: j['universidade']['id'], idCidade: j['universidade']['id_cidade'], nome: j['universidade']['nome']);

  toJson() => {
        'universidade': {'id': id, 'id_cidade': idCidade, 'nome': nome}
      };

  factory UniversidadeDB.toDB(Universidade universidade) =>
      UniversidadeDB(id: universidade.id, idCidade: universidade.idCidade, nome: universidade.nome);
}
