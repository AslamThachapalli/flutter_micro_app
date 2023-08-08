import 'package:flutter/material.dart';
import 'package:sa_micro_host/counter_micro_app/pages/counter_page.dart';
import 'package:sa_micro_host/counter_micro_app/pages/second_page.dart';

class CounterMaterialApp extends StatelessWidget {
  const CounterMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  // Internal Routing (NavigatorInstance agnostic)
  Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => CounterPage(title: "Count Increment Page"),
        );
      case 'counter/second_page':
        return MaterialPageRoute(
          builder: (_) => SecondPage(count: routeSettings.arguments as int),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text('Page Not Found (Example App)'),
            ),
          ),
        );
    }
  }
}
