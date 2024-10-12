import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key, this.textStyle, this.padding, this.iconSize});

  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;

  @override
  Widget build(BuildContext context) => TextButton.icon(
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
        onPressed: () => context.navigateTo('/'),
        label: Text(
          'Alejandro',
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
}
