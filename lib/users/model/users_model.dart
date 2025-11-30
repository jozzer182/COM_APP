// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart';

import '../../resources/constants/url.dart';
import '../../user/model/user_model.dart';

class Users {
  List<User> usersList = [];

  Future obtener() async {
    Map<String, Object> dataSend = {
      "info": {
        "libro": "USERS",
        "hoja": "USERS",
      },
      "fname": "getHoja"
    };
    final response = await post(
      Uri.parse(ApiUrl.com),
      body: jsonEncode(dataSend),
    );
    List dataAsListMap;
    if (response.statusCode == 302) {
      var response2 = await get(Uri.parse(response.headers["location"] ?? ''));
      dataAsListMap = jsonDecode(response2.body);
    } else {
      dataAsListMap = jsonDecode(response.body);
    }
    // print('dataAsListMap from users: $dataAsListMap');
    for (var item in dataAsListMap) {
      usersList.add(User.fromMap(item));
    }
    // print('usersList: ${usersList.toString()}');
    return usersList;
  }
}
