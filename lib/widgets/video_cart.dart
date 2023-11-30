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
        Row(
          children: [
            GestureDetector(
              onTap: () => print('Navigate to profile Screen'),
              child: CircleAvatar(
                foregroundImage: NetworkImage(video.author.profileImageUrl),
              ),
            ),
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
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${video.author.username}. ${video.viewCount} views. ${timeage.format(video.timestamp)}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
