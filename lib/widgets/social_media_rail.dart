import 'package:flutter/material.dart';

import '../models/social_media_data.dart';
import '../theme/material_window_class.dart';
import 'social_media_button.dart';

class SocialMediaRail extends StatelessWidget {
  const SocialMediaRail(this.socialMedia, {super.key, this.opacity = 0.9});

  final List<SocialMediaData> socialMedia;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final children = socialMedia
        .map(
          (media) => SocialMediaButton(
            media,
            color: colorScheme.onTertiaryContainer,
            hoverColor: colorScheme.tertiaryFixedDim,
            focusColor: colorScheme.tertiaryFixedDim,
          ),
        )
        .toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: colorScheme.tertiaryContainer.withOpacity(opacity),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: isWideScreen(context)
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: children,
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
    );
  }

  bool isWideScreen(BuildContext context) =>
      MaterialWindowClass.of(context) >= MaterialWindowClass.expanded;
}
