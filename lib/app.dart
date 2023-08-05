import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_list_app/core/controllers.dart';
import 'package:users_list_app/core/service/reqres_user_service.dart';
import 'package:users_list_app/core/storage/sprefs_user_storage.dart';
import 'package:users_list_app/pages/users_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(
      UserController(
        service: const ReqresUserService(),
        storage: const SharedPreferencesUserStorage(),
      ),
    );

    return const UsersPage();
  }
}
