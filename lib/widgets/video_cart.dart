import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_ui/data.dart';

import 'package:timeago/timeago.dart' as timeage;

class VideoCard extends StatelessWidget {
  final Video video;
  const VideoCard({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              video.thumbnailUrl,
              height: 220.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8.0,
              right: 8.0,
              child: Container(
                padding: const EdgeInsets.all(6.0),
                color: Colors.black,
                child: Text(
                  video.duration,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => log('Navigate to profile Screen'),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(video.author.profileImageUrl),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 15.0),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${video.author.username}. ${video.viewCount} views. ${timeage.format(video.timestamp)}',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    log('Navigate to more details screen');
                  },
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert)))
            ],
          ),
        )
      ],
    );
  }
}
