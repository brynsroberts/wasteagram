import 'package:flutter/material.dart';
import '../screens/camera_screen.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      onTapHint: 'Take an image of waste product',
      child: ElevatedButton(
        child: Icon(Icons.camera_alt),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CameraScreen(),
            ),
          );
        },
      ),
    );
  }
}
