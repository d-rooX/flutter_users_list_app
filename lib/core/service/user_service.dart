import 'package:users_list_app/core/models/user.dart';

abstract interface class UserService {
  Future<List<User>> getUsers(int page);
  Future<User> getUser(int id);
}
