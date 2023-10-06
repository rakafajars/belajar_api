import 'package:belajar_api/model/contact_model.dart';
import 'package:dio/dio.dart';

class ContactApi {
  // GET CONTACT
  static Future<List<ContactModel>> getContact() async {
    List<ContactModel> contatcList = [];
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
    );

    List<dynamic> contactData = response.data;

    for (var element in contactData) {
      contatcList.add(
        ContactModel.fromJson(element),
      );
    }

    return contatcList;
  }

  //   static Future<List<ContactModel>?> getContact() async {
  //   List<ContactModel>? contatcList = [];

  //   try {
  //     final response = await Dio().get(
  //       'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
  //     );

  //     List<dynamic> contactData = response.data;

  //     for (var element in contactData) {
  //       contatcList.add(
  //         ContactModel.fromJson(element),
  //       );
  //     }
  //   } catch (e) {
  //     return contatcList = null;
  //   }

  //   return contatcList;
  // }

  // CRATE CONTACT
  static Future<void> createContact() async {}

  // EDIT CONTACT

  // DETELE CONTACT
}
