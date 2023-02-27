import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class GowainghatSchoolNameListShow extends StatefulWidget {
  const GowainghatSchoolNameListShow({Key? key}) : super(key: key);

  @override
  _GowainghatSchoolNameListShowState createState() =>
      _GowainghatSchoolNameListShowState();
}

class _GowainghatSchoolNameListShowState
    extends State<GowainghatSchoolNameListShow> {
  var st = Get.arguments;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late List<String> dataArray;

  Future<void> fetchData() async {
    final CollectionReference collection = firestore.collection('user');
    final QuerySnapshot querySnapshot = await collection.get();
    final List<DocumentSnapshot> documents = querySnapshot.docs;

    final List<String> dataArray = [" "];

    documents.forEach((document) {
      final dynamic data = document.data();
      if (data.containsKey('noSchool')) {
        final List<dynamic> arrayData = data['noSchool'];
        arrayData.forEach((item) {
          dataArray.add(item.toString());
        });
      }
    });

    setState(() {
      this.dataArray = dataArray;
    });
  }

  @override
  void initState() {
    super.initState();
    dataArray = [""];
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shelter'),
      ),
      body: dataArray == null
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataArray.length,
              itemBuilder: (context, index) {
                final item = dataArray[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 79, 106, 255),
                    radius: 30,
                  ),
                  title: Text(item),
                  onTap: () {
                    print("");
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        /// you should  design
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "$item water 500",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  // ignore: prefer_const_constructors
                                  Text(
                                    "People 150",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  Text(
                                    "$index",
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 16.0),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}
