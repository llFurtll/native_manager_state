import 'package:flutter/material.dart';
import 'package:native_manager_state/pages/details/controllers/detail_controller.dart';
import 'package:native_manager_state/widgets/native_view.dart';

class DetailView extends NativeView<DetailController> {
  const DetailView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("LEGAL"),
      ),
    );
  }
}