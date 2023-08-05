import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:users_list_app/core/models/user.dart';
import 'package:users_list_app/core/storage/user_storage.dart';

class SharedPreferencesUserStorage implements UserStorage {
  const SharedPreferencesUserStorage();

  @override
  Future<void> saveUsers(List<User> users) async {
    final storage = await SharedPreferences.getInstance();

    final List<String> encodedUsers = [];
    for (final user in users) {
      encodedUsers.add(user.toJson());
    }

    await storage.setStringList('users', encodedUsers);
  }

  @override
  Future<List<User>> loadUsers() async {
    final storage = await SharedPreferences.getInstance();

    final List<String>? encodedUsers = storage.getStringList('users');
    if (encodedUsers == null) {
      return [];
    }

    final List<User> users = [];
    for (final userJson in encodedUsers) {
      final decodedUser = json.decode(userJson);
      users.add(User.fromJson(decodedUser));
    }

    return users;
  }

  @override
  Future<User?> loadUser(int id) async {
    final storage = await SharedPreferences.getInstance();

    final detailedUserJson = storage.getString('user_$id');
    if (detailedUserJson == null) {
      return null;
    }

    final detailedUser = User.fromJson(json.decode(detailedUserJson));
    return detailedUser;
  }

  @override
  Future<void> saveUser(User user) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString('user_${user.id}', user.toJson());
  }
}
