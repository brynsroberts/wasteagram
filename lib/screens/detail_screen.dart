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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${widget.post['date']}'),
              Image.network(
                '${widget.post['imageURL']}',
                width: 200,
                height: 200,
              ),
              Text('Items: ${widget.post['quantity']}'),
              Text(
                  'Location: (${widget.post['latitude']}, ${widget.post['longitude']})')
            ],
          ),
        ),
      ),
    );
  }
}
