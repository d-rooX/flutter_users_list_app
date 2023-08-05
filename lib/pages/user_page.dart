import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:users_list_app/core/controllers.dart';
import 'package:users_list_app/core/models/user.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    controller.getUser(user.id);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Hero(
          tag: "user_${user.id}",
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: Obx(() {
              final detailedUser = controller.detailedUsers[user.id];
              return UserInfo(user: detailedUser ?? user);
            }),
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    const emailStyle = TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 17,
    );

    return Material(
      type: MaterialType.transparency,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                minRadius: 45,
                backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${user.firstName} ${user.lastName}",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: nameStyle,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      user.email,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: emailStyle,
                    ),
                    Text(
                      "ID: ${user.id}",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (user.address != null) ...[
            Text("Address: \n${user.address}"),
            const SizedBox(height: 15),
          ],
          if (user.biography != null) ...[
            const Text(
              "Biography:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            const SizedBox(height: 5),
            Text(user.biography!)
          ],
        ],
      ),
    );
  }
}
