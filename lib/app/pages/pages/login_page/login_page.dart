import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:repime/app/global_widgets/button_back_app/button_back_app.dart';
import 'package:repime/app/global_widgets/button_text_app/button_text_app.dart';
import 'package:repime/app/global_widgets/loading_app/loading_app.dart';
import 'package:repime/app/pages/pages/login_page/ctr/ctr_login_page.dart';
import 'package:repime/app/pages/pages/login_page/widgets/animations/animation_opacity_login.dart';
import 'package:repime/app/pages/pages/login_page/widgets/dados_login.dart';

import 'widgets/cabecalho.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final ctr = CtrLoginPage();
  late final AnimationController ctrAnimation =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 1300));

  @override
  void initState() {
    super.initState();
    ctrAnimation.forward();
  }

  @override
  void dispose() {
    super.dispose();
    ctrAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: ctr.keyScaffold,
      body: Observer(builder: (_) {
        if (ctr.loading) {
          return const LoadingApp();
        }
        return Stack(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: ButtonBackApp(isAlternative: false, padding: true),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * .05, vertical: size.height * .03),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimationOpacityLogin(
                            ctrAnimation: ctrAnimation,
                            interval: const Interval(0, .4),
                            child: const Cabecalho()),
                        DadosLogin(ctr: ctr, ctrAnimation: ctrAnimation)
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonTextApp(text: 'Login', onPressed: ctr.onTapLogin),
                  ),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
