import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:hawkeye/app/modules/alert_category_page/models/get_category_model.dart';
import 'package:hawkeye/app/modules/alert_category_page/models/post_notification_model.dart';
import 'package:hawkeye/app/modules/home_page/models/report_model.dart';
import 'package:hawkeye/app/modules/home_page/models/report_stats_model.dart';
import 'package:hawkeye/app/modules/login_page/models/login_model.dart';
import 'package:hawkeye/app/modules/myreports_page/model/get_reports_model.dart';
import 'package:hawkeye/app/modules/registration_page/models/add_group_contacts_model.dart';
import 'package:hawkeye/app/modules/registration_page/models/registration_model.dart';
import 'package:hawkeye/app/modules/user_profile_page/models/user_profile_model.dart';
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

  Future<PostNotificationsModel> postLocation(Map<String, dynamic> body) async {
    String token = box.read('token');
    final response = await http.patch(
      Uri.parse('$baseUrl/user'),
      body: jsonEncode(body),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );

    return PostNotificationsModel.fromJson(jsonDecode(response.body));
  }

  Future<GetAlertCategoryModel> getAlertCategory() async {
    String token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/category'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );

    return GetAlertCategoryModel.fromJson(jsonDecode(response.body));
  }

  Future<PostNotificationsModel> postNotifications(String notifID) async {
    String token = box.read('token');
    final response = await http.post(
      Uri.parse('$baseUrl/notification/$notifID'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );

    print(response.body);

    return PostNotificationsModel.fromJson(jsonDecode(response.body));
  }

  Future<UserProfile> getUserProfile() async {
    String token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );
    print(response.body);

    final userProfile = UserProfile.fromJson(jsonDecode(response.body));
    box.write('user', userProfile);
  }

  Future<ReportStats> getStatistics() async {
    String token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/report'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );
    print(response.body);

    final userStats = ReportStats.fromJson(jsonDecode(response.body));
    box.write('stats', userStats);
  }

  Future<PostReportModel> postReport(Map<String, dynamic> body) async {
    String token = box.read('token');

    final response = await http.post(
      Uri.parse('$baseUrl/report'),
      body: jsonEncode(body),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );
    // final responseData = LoginModel.fromJson(jsonDecode(response.body));
    print(response.body);

    return PostReportModel.fromJson(jsonDecode(response.body));
  }

  Future<GetMyReportsModel> getMyReports() async {
    String token = box.read('token');
    final response = await http.get(
      Uri.parse('$baseUrl/report/all'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${token.toString()}',
        'Content-Type': 'application/json',
      },
    );
    print(response.body);

    return GetMyReportsModel.fromJson(jsonDecode(response.body));
  }
}
