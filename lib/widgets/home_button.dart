import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {super.key, this.textStyle, this.padding, this.iconSize, this.onPressed});

  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? iconSize;

  /// A callback function that is called when the button is pressed.
  /// This function is executed in addition to navigating to the home page.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        padding: padding,
      ),
      icon: SvgPicture.asset(
        'assets/icons/portfolio-icon.svg',
        height: iconSize,
        width: iconSize,
      ),
      onPressed: () => {onPressed?.call(), GoRouter.of(context).go('/')},
      label: Text(
        'Alejandro',
        style: textStyle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
