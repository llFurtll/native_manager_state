import 'package:example/controllers/second_controller.dart';
import 'package:flutter/material.dart';
import 'package:native_state/core/native_navigator.dart';
import 'package:native_state/widgets/native_view.dart';

class SecondView extends NativeView<SecondController> {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => NativeNavigator.back(arguments: "LEGAL2"),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: const Center(
        child: Text("Segunda página"),
      ),
    );
  }
}