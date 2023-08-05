import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:users_list_app/core/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(user.avatarUrl),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${user.firstName} ${user.lastName}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              Text(
                user.email,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
