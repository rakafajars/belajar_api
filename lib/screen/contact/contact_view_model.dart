import 'package:belajar_api/model/api/contact_api.dart';
import 'package:belajar_api/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactViewModel with ChangeNotifier {
  List<ContactModel>? _contatcList = [];

  List<ContactModel>? get contatcList => _contatcList;

  bool _isLoadingContact = true;

  bool get isLoadingContact => _isLoadingContact;

  void getAllContact() async {
    _isLoadingContact = true;
    try {
      final data = await ContactApi.getContact();
      _contatcList = data;
      print('Proses Berhasil');

      // _isLoadingContact = false;
    } catch (e) {
      print('Proses Catch $e');

      _contatcList = null;
      // _isLoadingContact = false;
    } finally {
      print('Proses Final');

      _isLoadingContact = false;
    }
    notifyListeners();
  }
}
