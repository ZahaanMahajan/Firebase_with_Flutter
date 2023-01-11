// ignore_for_file: file_names, prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;
  GetUserName({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get the collection
    CollectionReference user = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: user.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text(
            "${data['first name']}" +
                "  " +
                "${data['last name']}," +
                "   " +
                "${data['age']}" +
                " years old",
          );
        }
        return Text('loading...');
      }),
    );
  }
}
