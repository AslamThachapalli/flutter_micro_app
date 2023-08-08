import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';
import 'package:micro_commons/micro_commons.dart';
import 'package:sa_micro_host/counter_micro_app/pages/counter_material_app.dart';
import 'package:sa_micro_host/counter_micro_app/pages/counter_page.dart';
import 'package:sa_micro_host/counter_micro_app/pages/second_page.dart';

final incrementBy = ValueNotifier<int>(1);

class CounterMicroApp extends MicroApp with HandlerRegisterMixin {
  CounterMicroApp() {
    registerAllMicroEventHandlers();
  }

  @override
  String get name => 'Counter Micro App';

  final routes = CounterAppRoutes();

  @override
  List<MicroAppPage<Widget>> get pages => [
        MicroAppPage(
          route: routes.counterMaterialApp,
          pageBuilder: PageBuilder(
            builder: (context, arguments) => CounterMaterialApp(),
          ),
        ),
        MicroAppPage(
          route: routes.counterPage,
          pageBuilder: PageBuilder(
            builder: (context, arguments) =>
                CounterPage(title: 'Count Increment Page'),
          ),
        ),
        MicroAppPage(
          route: routes.secondPage,
          pageBuilder: PageBuilder(
            builder: (context, settings) => SecondPage(
              count: settings.arguments as int,
            ),
          ),
        ),
      ];

  registerAllMicroEventHandlers() {
    registerEventHandler<int>(
      MicroAppEventHandler(
        (event) {
          if (event.name == "reset_count_increment") {
            incrementBy.value = event.cast();

            event.resultSuccess('Increment Set');
          }
        },
      ),
    );
  }
}
