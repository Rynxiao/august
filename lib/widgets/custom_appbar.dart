import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../states/global_state.dart';
import '../theme/fontsize.dart';
import '../theme/fontweight.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? automaticallyImplyLeading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);
    final isDarkMode = globalState.isDarkMode;
    final themeData = Theme.of(context);
    var titleStyle = themeData.textTheme.headlineSmall?.copyWith(
      fontSize: AppFontSize.large,
      color: themeData.colorScheme.onSecondary,
      fontWeight: AppFontWeight.bold,
    );

    return AppBar(
      title: Text(title),
      titleTextStyle: titleStyle,
      iconTheme: IconThemeData(
        color: themeData.colorScheme.onSecondary,
      ),
      elevation: 0,
      systemOverlayStyle: isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      backgroundColor: backgroundColor ?? themeData.colorScheme.background,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
    );
  }

  @override
  Size get preferredSize => _PreferredAppBarSize(null, 0);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}
