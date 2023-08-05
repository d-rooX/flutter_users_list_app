import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users_list_app/core/models/user.dart';

import 'user_service.dart';

class ReqresUserService implements UserService {
  const ReqresUserService();

  @override
  Future<List<User>> getUsers(int page) async {
    final response = await http.get(
      Uri.https(
        "reqres.in",
        '/api/users',
        {'page': page.toString()},
      ),
    );
    final responseJson = json.decode(response.body);
    final List<User> users = [];
    for (final userMap in responseJson['data']) {
      users.add(User.fromJson(userMap));
    }

    return users;
  }

  @override
  Future<User> getUser(int id) async {
    final response = await http.get(
      Uri.parse("https://reqres.in/api/users/$id"),
    );
    final responseJson = json.decode(response.body);
    final userJson = responseJson['data'];

    // some mock data here as reqres API does not provide enough fields
    userJson['address'] =
        "Apt. 842 9569 Dustin Throughway, Friesenmouth, NV 75118";
    userJson['biography'] = "Not if anything to say about it I have";

    final user = User.fromJson(userJson);
    return user;
  }
}
