import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import '../models/waste_entry.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  String? url = '';
  String? text = '';
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  LocationData? locationData;

  void initState() {
    super.initState();
    retrieveLocation();
    getImage();
  }

  void retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
  }

  void getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    await firebase_storage.FirebaseStorage.instance
        .ref('${image!.path}')
        .putFile(image!);
    url = await firebase_storage.FirebaseStorage.instance
        .ref('${image!.path}')
        .getDownloadURL();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wasteagram',
        ),
      ),
      body: Center(
        child: url!.length == 0
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: SizedBox(
                          child: Image.network('$url', width: 200, height: 200),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a value';
                            }
                          },
                          onSaved: (value) {
                            text = value;
                          },
                          decoration: InputDecoration(
                              hintText: 'Number of wasted items'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 75,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Icon(Icons.cloud_upload),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            // get location

                            // create entry model
                            WasteEntry entry = WasteEntry(
                                date: DateFormat('EEE, MMM d, ' 'yyyy')
                                    .format(DateTime.now()),
                                imageURL: url!,
                                quantity: text!,
                                latitude: '${locationData!.latitude}',
                                longitude: '${locationData!.longitude}');

                            // save to database
                            FirebaseFirestore.instance.collection('food').add({
                              'date': entry.date,
                              'imageURL': entry.imageURL,
                              'latitude': entry.latitude,
                              'longitude': entry.longitude,
                              'quantity': entry.quantity
                            });

                            // pop back to home screen
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
