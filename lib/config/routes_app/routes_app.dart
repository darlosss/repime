import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:repime/app/pages/pages/detalhes_vaga_page/detalhes_vaga_page.dart';
import 'package:repime/app/pages/pages/login_page/login_page.dart';
import 'package:repime/app/pages/pages/perfil_locador_page/perfil_locador_page.dart';
import 'package:repime/config/routes_app/guards/first_page/first_page_guard.dart';

import '../../app/pages/pages/adicionar_vaga_page/adicionar_vaga_page.dart';
import '../../app/pages/pages/detalhes_vaga_mapa_page/detalhes_vaga_mapa_page.dart';
import '../../app/pages/pages/first_page/first_page.dart';
import '../../app/pages/pages/home_page/home_page.dart';
import '../../app/pages/pages/registrar_locador_page/registrar_locador_page.dart';

class RouteApp {
  String name;
  Widget route;
  List<RouteGuard>? guards;
  RouteApp({required this.name, required this.route, this.guards});

  ChildRoute get childRoute => ChildRoute(name, child: (context, args) => route, guards: guards ?? []);

  static RouteApp firstPage = RouteApp(name: '/', guards: [FirstPageCheckCache()], route: const FirstPage());

  static RouteApp homePage = RouteApp(name: '/homePage', route: const HomePage());

  static RouteApp registrarLocadorPage =
      RouteApp(name: '/registrarLocadorPage', route: const RegistrarLocadorPage());

  static RouteApp adicionarVaga = RouteApp(name: '/adicionarVaga', route: const AdicionarVagaPage());

  static RouteApp detalhesVaga = RouteApp(name: '/detalhesVaga', route: const DetalhesVagaPage());

  static RouteApp perfilLocador = RouteApp(name: '/perfilLocador', route: const PerfilLocadorPage());

  static RouteApp loginLocador = RouteApp(name: '/loginLocador', route: const LoginPage());

  static RouteApp detalhesVagaMapa = RouteApp(name: '/detalhesVagaMapa', route: const DetalhesVagaMapaPage());
}
