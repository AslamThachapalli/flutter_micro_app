import 'package:flutter/material.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

class ChangeContainerClrPage extends StatefulWidget {
  const ChangeContainerClrPage({super.key});

  @override
  State<ChangeContainerClrPage> createState() => _ChangeContainerClrPageState();
}

class _ChangeContainerClrPageState extends State<ChangeContainerClrPage> {
  final List<Color> colors = [Colors.blue, Colors.orange, Colors.green];

  int selectedIndex = -1;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Color"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Any of the Color"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                colors.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      selectedColor = colors[index];
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        border: selectedIndex == index
                            ? Border.all(
                                width: 2,
                                color: Colors.black,
                              )
                            : null,
                        color: colors[index]),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                if (selectedIndex > -1) {
                  MicroAppEventController()
                      .emit(MicroAppEvent(
                        payload: selectedColor!,
                        channels: const ['theme'],
                      ))
                      .getFirstResult()
                      .then((value) {
                    if (value is bool) {
                      if (value) {
                        context.maNav.pop();
                      }
                    }
                  });
                }
              },
              child: Text("Set Color"),
            ),
          ],
        ),
      ),
    );
  }
}
