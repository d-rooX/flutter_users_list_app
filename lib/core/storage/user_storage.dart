import 'package:users_list_app/core/models/user.dart';

abstract interface class UserStorage {
  Future<void> saveUsers(List<User> users);
  Future<List<User>> loadUsers();
  Future<void> saveUser(User user);
  Future<User?> loadUser(int id);
}
