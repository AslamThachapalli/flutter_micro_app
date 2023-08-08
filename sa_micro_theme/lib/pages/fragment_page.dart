import 'package:flutter/material.dart';

class FragmentPage extends StatelessWidget {
  const FragmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: const SingleChildScrollView(
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white, fontSize: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 8),
              Text(
                'This Widget is coming from the `Theme MicroApp` ',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text('Don\'t pop this route'),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
