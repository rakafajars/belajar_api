import 'package:belajar_api/model/api/dice_bear_api.dart';
import 'package:flutter/material.dart';

class DiceBearViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final TextEditingController _diceBearController = TextEditingController();
  TextEditingController get diceBearController => _diceBearController;

  String _imageData = "";
  String get imageData => _imageData;

  void getDiceBear() async {
    _isLoading = true;
    notifyListeners();

    _imageData = await DiceBearApi().getDiceBear(
      avatarStyle: _diceBearController.text,
    );
    _isLoading = false;
    notifyListeners();
  }
}
