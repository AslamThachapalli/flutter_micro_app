import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';
import 'package:sa_micro_host/counter_micro_app/counter_micro_app.dart';

class SecondPage extends StatelessWidget {
  final int count;
  const SecondPage({required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Status Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the FAB ${count ~/ incrementBy.value} times!',
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                context.maNav.popUntil((route) => route.isFirst);
              },
              child: Text("Go to Host App"),
            ),
          ],
        ),
      ),
    );
  }
}
