import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
        stream: FirebaseFirestore.instance.collection('food').snapshots(),
        builder: (content, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: (snapshot.data!).docs.length,
              itemBuilder: (context, index) {
                var post = (snapshot.data!).docs[index];
                return ListTile(
                  title: Text(
                    post['name'],
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
