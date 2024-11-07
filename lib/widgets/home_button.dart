import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'better_link.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    this.textStyle,
    this.padding,
    this.iconSize,
    this.closeDrawer = false,
  });

  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;
  final bool closeDrawer;

  @override
  Widget build(BuildContext context) => BetterLink(
        uri: Uri.parse('/'),
        builder: (context, followLink) => TextButton.icon(
          style: TextButton.styleFrom(
            padding: padding,
          ).copyWith(
            overlayColor: WidgetStateProperty.resolveWith(
              (states) => states.contains(WidgetState.focused)
                  ? null
                  : Colors.transparent,
            ),
          ),
          icon: SvgPicture.asset(
            'assets/icons/portfolio-icon.svg',
            height: iconSize,
            width: iconSize,
          ),
          onPressed: () async {
            if (closeDrawer) Navigator.of(context).pop();
            return followLink?.call();
          },
          label: Text(
            'Alejandro',
            style: textStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
}
