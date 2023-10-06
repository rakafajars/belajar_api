import 'dart:convert';

import 'package:belajar_api/model/contact_list_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String url = "";

String urlHistory = "";

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

  String? token;
  void login({required String username, required String password}) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    final response = await Dio().post(
      url,
      data: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      sharedPref.setString(
        'token',
        response.data["token"],
      );
    } else {
      sharedPref.remove('token');
    }
  }

  void getHistory() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    String? token = sharedPref.getString('token');

    print(token);

    final response = await Dio().get(
      urlHistory,
      options: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );
    print(response.data);
  }

  void getToken() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
  }

  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    getContact();
    getToken();
    getHistory();
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
