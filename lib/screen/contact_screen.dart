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
  // List<ContactListResponse> _contactListResponse = [];

  // void getContact() {
  //   Dio()
  //       .get(
  //           'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
  //       .then(
  //     (value) {
  //       List<dynamic> _contactData = value.data;

  //       for (var element in _contactData) {
  //         _contactListResponse.add(
  //           ContactListResponse.fromJson(element),
  //         );
  //       }

  //       setState(() {});
  //     },
  //   );
  // }

  Future<List<ContactListResponse>> getContact() async {
    List<ContactListResponse> contatcList = [];
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      List<dynamic> contactData = response.data;

      for (var element in contactData) {
        contatcList.add(
          ContactListResponse.fromJson(element),
        );
      }
    } else {
      throw Exception('Data Ini Error');
    }

    return contatcList;
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
        child: FutureBuilder<List<ContactListResponse>>(
          future: getContact(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Data Error');
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Text(snapshot.data?[index].name ?? "");
                },
              );
            }
          },
        ),
      ),
    );
  }
}
