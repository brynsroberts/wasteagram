import 'package:flutter/material.dart';
import '../widgets/home_list_view.dart';
import '../widgets/camera_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wasteagram',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            HomeListView(),
            CameraButton(),
          ],
        ),
      ),
    );
  }
}
