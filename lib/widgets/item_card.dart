import 'package:flutter/material.dart';
import 'package:wasteagram/models/waste_entry.dart';
import 'package:wasteagram/screens/detail_screen.dart';

class ItemCard extends StatelessWidget {
  final WasteEntry entry;

  const ItemCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      onTapHint: 'click on card to get more details about waste product',
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(entry: entry),
              ),
            );
          },
          title: Text(
            entry.date,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: Text(
            entry.quantity,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
    );
  }
}
