import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';
import 'package:micro_commons/micro_commons.dart';
import 'package:sa_micro_theme/pages/change_container_clr_page.dart';
import 'package:sa_micro_theme/pages/fragment_page.dart';
import 'package:sa_micro_theme/pages/increment_setter_page.dart';

class ThemeMicroApp extends MicroAppWithBaseRoute {
  @override
  List<MicroAppPage<Widget>> get pages => [
        MicroAppPage<IncrementSetterPage>(
          route: ThemeAppRoutes().incrementCount,
          pageBuilder: PageBuilder(
            builder: (_, __) => IncrementSetterPage(),
          ),
        ),
        MicroAppPage<FragmentPage>(
          route: ThemeAppRoutes().fragmentPage,
          pageBuilder: PageBuilder(
            builder: (_, __) => FragmentPage(),
          ),
        ),
        MicroAppPage<ChangeContainerClrPage>(
          route: ThemeAppRoutes().setColorPage,
          pageBuilder: PageBuilder(
            builder: (_, __) => ChangeContainerClrPage(),
          ),
        ),
      ];

  @override
  MicroAppBaseRoute get baseRoute => ThemeAppRoutes();

  @override
  String get name => "Theme Micro App";
}
