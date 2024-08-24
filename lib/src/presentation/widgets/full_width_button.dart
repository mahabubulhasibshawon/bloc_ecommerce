import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_pages.dart';

class FullWidthButton extends StatelessWidget {
  const FullWidthButton(
      {super.key,
      this.onTap,
      this.backgroundColor,
      this.textColor,
      required this.buttonText,
      this.textStyle,
      this.buttonChild});

  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final String buttonText;
  final TextStyle? textStyle;
  final Widget? buttonChild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.h,
        color:
            backgroundColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
        child: Center(
            child: buttonChild ??
                Text(
                  'Create An Account',
                  style: textStyle ??
                      Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: textColor ??
                              Theme.of(context).colorScheme.onSecondary),
                )),
      ),
    );
  }
}
