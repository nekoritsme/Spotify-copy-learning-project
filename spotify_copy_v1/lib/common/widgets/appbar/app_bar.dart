import 'package:flutter/material.dart';
import 'package:spotify_copy_v1/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar(
      {this.title,
      this.hideBack = false,
      this.backgroundColor,
      super.key,
      this.action});

  final bool hideBack;
  final Widget? title;
  final Widget? action;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      title: title ?? const Text(""),
      actions: [action ?? Container()],
      centerTitle: true,
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: context.isDarkmode
                        ? Colors.white.withAlpha(03)
                        : Colors.black.withAlpha(04),
                    shape: BoxShape.circle),
                child: Icon(Icons.arrow_back_ios_new),
              )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
