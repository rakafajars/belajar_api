// To parse this JSON data, do
//
//     final contactListResponse = contactListResponseFromJson(jsonString);

import 'dart:convert';

List<ContactListResponse> contactListResponseFromJson(String str) =>
    List<ContactListResponse>.from(
        json.decode(str).map((x) => ContactListResponse.fromJson(x)));

String contactListResponseToJson(List<ContactListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContactListResponse {
  int id;
  String name;
  String phone;

  ContactListResponse({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory ContactListResponse.fromJson(Map<String, dynamic> json) =>
      ContactListResponse(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
