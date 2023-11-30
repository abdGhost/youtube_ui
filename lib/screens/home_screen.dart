import 'package:flutter/material.dart';
import 'package:youtube_ui/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 100.0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset('assets/yt_logo_dark.png'),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cast),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_add_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 40.0,
                icon: CircleAvatar(
                  foregroundImage: NetworkImage(currentUser.profileImageUrl),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
