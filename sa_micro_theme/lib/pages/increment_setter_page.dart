import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_micro_app/flutter_micro_app.dart';

final incrementVal = ValueNotifier<int>(1);

class IncrementSetterPage extends StatelessWidget {
  const IncrementSetterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text("Reset Increment value of Counter Micro App"),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  --incrementVal.value;
                },
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 12),
              ValueListenableBuilder(
                valueListenable: incrementVal,
                builder: (_, val, __) => Text("$val"),
              ),
              SizedBox(width: 12),
              IconButton(
                onPressed: () {
                  ++incrementVal.value;
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          OutlinedButton(
            onPressed: () {
              MicroAppEventController().emit(
                MicroAppEvent(
                  name: 'reset_count_increment',
                  payload: incrementVal.value,
                  channels: const ['count'],
                ),
              );
            },
            child: Text("SET"),
          ),
        ],
      ),
    );
  }
}

class IncrementSetterFloatFrame extends StatefulWidget {
  final MicroAppOverlayController controller;
  final Widget child;

  const IncrementSetterFloatFrame({
    required this.controller,
    required this.child,
    super.key,
  });

  @override
  State<IncrementSetterFloatFrame> createState() =>
      _IncrementSetterFloatFrameState();
}

class _IncrementSetterFloatFrameState extends State<IncrementSetterFloatFrame> {
  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    widget.controller.close();
                  },
                  icon: const Icon(Icons.close)),
              IconButton(
                  onPressed: () {
                    // Maximize
                    widget.controller.x = 0;
                    widget.controller.y = 50;
                    widget.controller.height =
                        MediaQuery.of(context).size.height - 50;
                    widget.controller.width = MediaQuery.of(context).size.width;
                    widget.controller.isDraggable = false;
                    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
                  },
                  icon: const Icon(Icons.crop_square)),
              const Spacer(),
              Text(
                widget.controller.isDraggable
                    ? 'This is a draggable window'
                    : 'This is not a draggable window',
                style: TextStyle(
                    color: widget.controller.isDraggable
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.drag_indicator)
            ],
          ),
          Expanded(
            child: widget.child,
          )
        ],
      ),
    );
  }
}
