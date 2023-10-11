import 'package:belajar_api/model/api/valorant_api.dart';
import 'package:belajar_api/model/valorant_model/list_agent_valorant_model.dart';
import 'package:flutter/material.dart';

class ValorantViewModel extends ChangeNotifier {
  bool _isLoadingAgentValorant = false;
  bool get isLoadingAgentValorant => _isLoadingAgentValorant;

  List<AgentValorantModel> _listAgentValorant = [];
  List<AgentValorantModel> get listAgentValorant => _listAgentValorant;

  // default languange bahasa inggris
  String _defaultLanguage = "en-US";
  String get defaultLanguage => _defaultLanguage;

  void changeLanguage({required String language}) async {
    _defaultLanguage = language;

    getAgentValorant();
    notifyListeners();
  }

  void getAgentValorant() async {
    _isLoadingAgentValorant = true;
    notifyListeners();

    _listAgentValorant = await ValorantApi().getListAgentValorant(
      language: _defaultLanguage,
    );

    _isLoadingAgentValorant = false;
    notifyListeners();
  }
}
