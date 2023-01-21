
import 'package:flutter/material.dart';
import 'package:makan_employee/core/utils/app_ui.dart';

import 'app_text.dart';

class MakanAppbar extends AppBar {
  MakanAppbar(
    context, {
    Key? key,
    Function()? onLeadingTap,
    bool? isTitleCenterd,
    Widget? leading,
    bool? isLeading = true,
    Color? leadingIconColor,
    Color? backIconColor,
    Widget? title,
    double? leadingWidth,
    bool? showMenu,
    Widget? flexibleSpace,
    String? titleText,
    List<Widget>? actions,
    void Function()? onActionTap,
    PreferredSizeWidget? bottom,
    Color? backgroundColor,
  }) : super(
          key: key,
          bottom: bottom,
          backgroundColor: AppUi.colors.lightGreyColor,
          leadingWidth: leadingWidth ?? 56,
          leading: leading ??
              (IconButton(
                  onPressed: () {
                    if (onLeadingTap != null) {
                      onLeadingTap();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                  ))),
          title: title ??
              AppText(
                titleText ?? '',
                color: AppUi.colors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                textOverflow: TextOverflow.visible,
              ),
          actions: actions ??
              [
                
              ],
          centerTitle: isTitleCenterd ?? true,
          flexibleSpace: flexibleSpace,
          elevation: 0.0,
        );
}
