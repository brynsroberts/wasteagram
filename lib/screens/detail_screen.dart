import 'package:flutter/material.dart';
import 'package:wasteagram/models/waste_entry.dart';
import '../widgets/detail_image.dart';

class DetailScreen extends StatefulWidget {
  final WasteEntry entry;
  DetailScreen({Key? key, required this.entry}) : super(key: key);

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
              Text(
                '${widget.entry.date}',
                style: Theme.of(context).textTheme.headline4,
              ),
              DetailImage(url: widget.entry.imageURL),
              Text(
                'Items: ${widget.entry.quantity}',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Latitude: ${widget.entry.latitude}',
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                'Longitude: ${widget.entry.longitude}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
