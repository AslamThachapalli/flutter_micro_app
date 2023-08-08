import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';
import 'package:sa_micro_host/counter_micro_app/counter_micro_app.dart';
import 'package:micro_commons/micro_commons.dart';
import 'package:sa_micro_host/dynamic_container_page.dart';
import 'package:sa_micro_theme/pages/increment_setter_page.dart';
import 'package:sa_micro_theme/theme_micro_app.dart';

void main() {
  // Define micro app configurations here
  // final isAndroid = Platform.isAndroid;
  // MicroAppPreferences.update(
  //   MicroAppConfig(
  //     nativeEventsEnabled: isAndroid,
  //     nativeNavigationCommandEnabled: isAndroid,
  //     nativeNavigationLogEnabled: false,
  //     pageTransitionType: MicroPageTransitionType.platform,
  //     onRouteNotRegistered: (route, {arguments, type, context}) {
  //       // ignore: avoid_print
  //       print(
  //           'CALLBACK:[OnRouteNotRegistered] Route not found: $route, $arguments, $type');
  //     },
  //   ),
  // );

  runApp(MyApp());
}

class MyApp extends MicroHostStatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigatorInstance.navigatorKey,
      onGenerateRoute: onGenerateRoute,
      initialRoute: maAppBaseRoute,
      navigatorObservers: [NavigatorInstance],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.deepPurple[50],
        useMaterial3: true,
      ),
      home: const BasePage(),
    );
  }

  @override
  // TODO: implement initialMicroApps
  List<MicroApp> get initialMicroApps => [
        CounterMicroApp(),
        ThemeMicroApp(),
      ];

  @override
  // TODO: implement pages
  List<MicroAppPage<Widget>> get pages => [
        MicroAppPage<BasePage>(
          route: maAppBaseRoute,
          pageBuilder: PageBuilder(
            builder: (_, __) => BasePage(),
          ),
        ),
        MicroAppPage<DynamicContainerPage>(
          route: '/dynamic_container',
          pageBuilder: PageBuilder(
            builder: (_, __) => DynamicContainerPage(),
          ),
        ),
      ];
}

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Host App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.maNav.pushNamed(CounterAppRoutes().counterPage);
              },
              child: Text("Go to Counter Micro App"),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final controller = MicroAppOverlayController(
                  isDraggable: true,
                  position:
                      Offset((MediaQuery.of(context).size.width * .05), 100),
                  size: Size(MediaQuery.of(context).size.width * .9, 220),
                  route: ThemeAppRoutes().incrementCount,
                );

                controller.open(
                  builder: (child, controller) => IncrementSetterFloatFrame(
                    controller: controller,
                    child: child,
                  ),
                );
              },
              child: Text("Reset Increment Value from a Float Page"),
            ),
            // SizedBox(height: 12),
            // ElevatedButton(
            //   onPressed: () {
            //     context.maNav.pushNamed(CounterAppRoutes().counterMaterialApp);
            //   },
            //   child: Text("Go to counter material app"),
            // ),
            Container(
              height: 100,
              constraints: BoxConstraints(maxWidth: 450),
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 28),
              child: context.maNav.getPageWidget(
                ThemeAppRoutes().fragmentPage,
                orElse: Container(
                  height: 50,
                  width: 100,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                context.maNav.pushNamed('/dynamic_container');
              },
              child: Text("Go To Dynamic Container"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MicroBoard().showBoard();
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}
