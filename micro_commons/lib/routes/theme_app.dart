import 'package:flutter_micro_app/flutter_micro_app.dart';

class ThemeAppRoutes extends MicroAppBaseRoute {
  @override
  MicroAppRoute get baseRoute => MicroAppRoute('theme');

  String get incrementCount => path(['increment_count']);
  String get fragmentPage => path(['fragment_page']);
  String get setColorPage => path(['set_color']);
}
