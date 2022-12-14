import 'dart:convert';

import 'package:repime/app/blocs/connection_database/connection_database.dart';
import 'package:repime/app/blocs/locador/locador.dart';
import 'package:repime/app/blocs/residencia/db/residencia_db.dart';
import 'package:repime/app/blocs/util/cache_manager/cache_utility.dart';

import '../../residencia/residencia.dart';

class LocadorDB extends Locador {
  LocadorDB(
      {required super.id, required super.contato, required super.nome, required super.senha, super.foto});

  static Future<void> inserirInDB(Locador locador) async => await ConnectionDataBase().make(QueryDataBase(
          commandSQL:
              "SELECT * FROM adicionar_locador(@locadorNome, @locadorSenha, @locadorContato, @locadorFoto)",
          arguments: {
            'locadorNome': locador.nome,
            'locadorSenha': locador.senha,
            'locadorContato': locador.contato,
            'locadorFoto': locador.foto
          }));

  static Future<LocadorDB?> makeLogin(String nome, String senha) async {
    var json = (await ConnectionDataBase().make(QueryDataBase(
        commandSQL: "SELECT * FROM check_locador(@nomeLocador, @senhaLocador)",
        arguments: {'nomeLocador': nome, 'senhaLocador': senha})));
    if (json.isEmpty) return null;
    var l = LocadorDB.fromLogin(json[0][''], senhaDecodificada: senha);
    l.setResidencia = await l.getResidencia();
    return l;
  }

  Future<Residencia> getResidencia() async => await ResidenciaDB.getAll(this);

  static Future<bool> existsUsername(String nome) async => (await ConnectionDataBase().make(QueryDataBase(
          commandSQL: 'SELECT * FROM locador WHERE nome = @loc_nome', arguments: {'loc_nome': nome})))
      .isNotEmpty;

  static LocadorDB fromLogin(j, {required String senhaDecodificada}) {
    return LocadorDB(
        contato: j['contato'], id: j['id'], nome: j['nome'], senha: senhaDecodificada, foto: j['foto']);
  }

  static getLocadorFromResidencia(int idResidencia) async {
    var result = await ConnectionDataBase().make(QueryDataBase(
        commandSQL:
            "SELECT l.id, l.nome, l.contato FROM locador as l JOIN residencia as r ON l.id = r.id_locador WHERE r.id = @idR",
        arguments: {'idR': idResidencia}));
    return fromLogin(result[0]['locador'], senhaDecodificada: '');
  }

  static const String _pathFile = 'locador_json';
  String get _pathImage => 'locador_image_$id';

  Future<void> setCache() async {
    foto = await _setCacheImage();
    await CacheUtility.setCache(pathName: _pathFile, cache: toJson());
  }

  static Future<LocadorDB?> getCache() async {
    var cache = await CacheUtility.getCache(_pathFile);
    if (cache == null) return null;
    return LocadorDB.fromCache(cache);
  }

  Future<void> deleteCache() async {
    await CacheUtility.deleteCache(_pathFile);
    await CacheUtility.deleteImage(_pathImage);
  }

  Future<String?> _setCacheImage() async {
    if (foto == null) return null;
    return await CacheUtility.setImage(base64Decode(foto!), _pathImage);
  }

  static LocadorDB toDB(Locador l) =>
      LocadorDB(contato: l.contato, id: l.id, nome: l.nome, senha: l.senha, foto: l.foto);

  toJson() => {
        'id': id,
        'contato': contato,
        'nome': nome,
        'foto': foto,
        'senha': senha,
        'residencia': residencia != null ? ResidenciaDB.toDB(residencia!).toJson() : null
      };

  factory LocadorDB.fromCache(j) {
    var loc =
        LocadorDB(contato: j['contato'], id: j['id'], nome: j['nome'], senha: j['senha'], foto: j['foto']);

    loc.setResidencia = ResidenciaDB.fromCache(j);
    return loc;
  }
}
