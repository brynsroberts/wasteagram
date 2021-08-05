import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final post;
  DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
        child: Center(
          child: Column(
            children: [
              Text('${widget.post['date']}'),
              Image.network('${widget.post['imageURL']}'),
              Text('Items: ${widget.post['quantity']}'),
              Text(
                  'Location: (${widget.post['longitude']}, ${widget.post['latitude']})')
            ],
          ),
        ),
      ),
    );
  }
}
