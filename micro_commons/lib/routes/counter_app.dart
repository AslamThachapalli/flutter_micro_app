import 'package:flutter_micro_app/flutter_micro_app.dart';

class CounterAppRoutes extends MicroAppBaseRoute {
  @override
  MicroAppRoute get baseRoute => MicroAppRoute('counter');

  String get counterMaterialApp => path(['counter_material_app']);
  String get counterPage => path(['counter_page']);
  String get secondPage => path(['second_page']);
}
