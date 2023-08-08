import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';
import 'package:micro_commons/micro_commons.dart';

final containerColor = ValueNotifier<Color>(Colors.red);

class DynamicContainerPage extends StatefulWidget {
  const DynamicContainerPage({super.key});

  @override
  State<DynamicContainerPage> createState() => _DynamicContainerPageState();
}

class _DynamicContainerPageState extends State<DynamicContainerPage>
    with HandlerRegisterStateMixin {
  @override
  void initState() {
    super.initState();

    registerEventHandler<Color>(
      MicroAppEventHandler(
        (event) {
          containerColor.value = event.cast();

          event.resultSuccess(true);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Container"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: containerColor,
              builder: (_, col, __) => Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 80),
                color: col,
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                context.maNav.pushNamed(ThemeAppRoutes().setColorPage);
              },
              child: Text("Change Color"),
            ),
          ],
        ),
      ),
    );
  }
}
