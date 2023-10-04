import 'dart:convert';

import 'package:belajar_api/model/contact_list_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<ContactListResponse> _contactListResponse = [];

  void getContact() {
    Dio()
        .get(
            'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
        .then(
      (value) {
        List<dynamic> _contactData = value.data;

        for (var element in _contactData) {
          _contactListResponse.add(
            ContactListResponse.fromJson(element),
          );
        }

        setState(() {});
      },
    );
  }

  @override
  void initState() {
    getContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact API',
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _contactListResponse.length,
          itemBuilder: (context, index) {
            return Text(
              _contactListResponse[index].name,
            );
          },
        ),
      ),
    );
  }
}
