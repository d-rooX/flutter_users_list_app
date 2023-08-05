import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_list_app/core/controllers.dart';
import 'package:users_list_app/pages/user_page.dart';
import 'package:users_list_app/widgets/user_card.dart';

class UsersPage extends GetView<UserController> {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (controller.users.isEmpty) {
      controller.getUsers();
    }

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.purpleAccent,
            ],
          ),
        ),
        child: Obx(
          () => GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              mainAxisExtent: 110,
            ),
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return GestureDetector(
                onTap: () => Get.to(() => UserPage(user)),
                // using Hero widget to pretty-animate transition
                child: Hero(
                  tag: "user_${user.id}",
                  // used Material widget here to fix Hero styles error
                  // https://github.com/flutter/flutter/issues/30647#issuecomment-509712719
                  child: Material(
                    type: MaterialType.transparency,
                    child: UserCard(user),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
