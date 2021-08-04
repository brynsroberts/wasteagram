import 'package:flutter/material.dart';
import '../widgets/home_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          HomeListView(),
          ElevatedButton(
            child: Icon(Icons.camera_alt),
            onPressed: () {
              print('camera pressed');
            },
          ),
        ],
      ),
    );
  }
}
