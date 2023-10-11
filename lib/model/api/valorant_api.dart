import 'package:belajar_api/model/valorant_model/list_agent_valorant_model.dart';
import 'package:dio/dio.dart';

class ValorantApi {
  Future<List<AgentValorantModel>> getListAgentValorant({
    required String language,
  }) async {
    try {
      final response = await Dio().get(
        "https://valorant-api.com/v1/agents?language=$language",
      );

      List<AgentValorantModel> listAgent = [];

      List<dynamic> responseData = response.data["data"];

      for (var element in responseData) {
        listAgent.add(AgentValorantModel.fromJson(element));
      }

      return listAgent;
    } catch (e) {
      throw Exception(e);
    }
  }
}
