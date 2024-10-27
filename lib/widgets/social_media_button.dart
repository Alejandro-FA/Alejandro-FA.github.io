import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/social_media_data.dart';
import 'better_link.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton(
    this.data, {
    required this.color,
    this.hoverColor,
    this.focusColor,
    super.key,
  });

  final SocialMediaData data;
  final Color color;
  final Color? hoverColor;
  final Color? focusColor;

  @override
  Widget build(BuildContext context) => BetterLink(
        uri: Uri.parse(data.url),
        // target: LinkTarget.blank,
        builder: (context, followLink) => IconButton(
          icon: SvgPicture.asset(
            data.iconPath,
            height: 30,
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
          ),
          hoverColor: hoverColor,
          focusColor: focusColor,
          onPressed: followLink,
          padding: const EdgeInsets.all(10),
        ),
      );
}
