import 'package:flutter/material.dart';

class TemporaryMainScreen extends StatelessWidget {
  const TemporaryMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 200,
      height: 200,
      child: const Center(
        child: Text("From here , the Shopping Will Continue"),
      ),
    );
  }
}
