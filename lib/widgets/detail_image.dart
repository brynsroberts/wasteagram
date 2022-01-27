import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  final String url;
  const DetailImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      '$url',
      width: 200,
      height: 200,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
