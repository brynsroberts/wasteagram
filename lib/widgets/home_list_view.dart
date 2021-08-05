import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/screens/detail_screen.dart';
import '../screens/detail_screen.dart';

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key}) : super(key: key);

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('food')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (content, snapshot) {
          if (snapshot.hasData && (snapshot.data!).docs.length > 0) {
            return ListView.builder(
              itemCount: (snapshot.data!).docs.length,
              itemBuilder: (context, index) {
                var post = (snapshot.data!).docs[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(post: post),
                        ),
                      );
                    },
                    title: Text(
                      post['date'],
                    ),
                    trailing: Text(
                      post['quantity'],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
