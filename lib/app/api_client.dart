import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:hawkeye/app/modules/login_page/models/login_model.dart';
import 'package:hawkeye/app/modules/registration_page/models/add_group_contacts_model.dart';
import 'package:hawkeye/app/modules/registration_page/models/registration_model.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'https://hawk-eye-backend.herokuapp.com/api';

  final box = GetStorage();

  Future<RegistrationModel> registerUser(Map<String, dynamic> body) async {
    final response =
        await http.post(Uri.parse('$baseUrl/auth/signup'), body: body);
    final responseData = RegistrationModel.fromJson(jsonDecode(response.body));
    box.write('token', responseData.data.token.toString());
    return RegistrationModel.fromJson(jsonDecode(response.body));
  }

  // login endpoint integration
  Future<LoginModel> loginUser(Map<String, dynamic> body) async {
    final response =
        await http.post(Uri.parse('$baseUrl/auth/signin'), body: body);
    final responseData = LoginModel.fromJson(jsonDecode(response.body));
    if (responseData.data != null) {
      box.write('token', responseData.data.token.toString());
    }

    return LoginModel.fromJson(jsonDecode(response.body));
  }

  Future<AddGroupContactsModel> addGroupContact(List body) async {
    String token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/contacts/many'),
      body: jsonEncode(body),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );

    return AddGroupContactsModel.fromJson(jsonDecode(response.body));
  }
}
