import 'package:example/controllers/second_controller.dart';
import 'package:flutter/material.dart';
import 'package:native_state/widgets/native_view.dart';

class SecondView extends NativeView<SecondController> {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Segunda página"),
      ),
    );
  }
}