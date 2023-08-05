import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:users_list_app/core/models/user.dart';
import 'package:users_list_app/core/service/user_service.dart';
import 'package:users_list_app/core/storage/user_storage.dart';

class UserController extends GetxController {
  final UserService service;
  final UserStorage storage;
  UserController({required this.service, required this.storage});

  final users = <User>[].obs;
  final detailedUsers = <int, User>{}.obs;

  getUsers({int page = 1}) async {
    List<User> _users;
    try {
      _users = await service.getUsers(page);
      await storage.saveUsers(_users);
    } on ClientException {
      _users = await storage.loadUsers();
    }

    users.clear();
    users.addAll(_users);
  }

  getUser(int id) async {
    try {
      final user = await service.getUser(id);
      detailedUsers[id] = user;
      await storage.saveUser(user);
    } on ClientException {
      final user = await storage.loadUser(id);
      if (user != null) {
        detailedUsers[id] = user;
      }
    }
  }
}
