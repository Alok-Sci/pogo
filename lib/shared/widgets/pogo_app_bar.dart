import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/context_extensions.dart';
import 'package:pogo/core/utils/double_extensions.dart';
import 'package:pogo/shared/widgets/circular_icon_button.dart';

class PogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PogoAppBar({
    super.key,
    required this.title,
    this.infoText,
  });
  final String title;
  final String? infoText;

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (infoText != null ? 37 : 0));

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyles.headingSemiBold16.copyWith(color: Palette.black),
      ),
      leadingWidth: 50,
      leading: Center(
        child: Transform.translate(
          offset: const Offset(10, 0),
          child: SizedBox(
            height: 34,
            child: CircularIconButton(
              onPressed: () {
                context.pop();
              },
              iconPath: AppIcons.chevronLeft,
              radius: 17,
              backgroundColor: Palette.white,
              foregroundColor: Palette.lightStoneGrey,
            ),
          ),
        ),
      ),
    );

    return infoText == null
        ? appBar
        : PreferredSize(
            preferredSize: preferredSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: context.appColors.headerInvertedGradient,
                borderRadius: AppRadii.m.bottomCircular,
                backgroundBlendMode: BlendMode.colorBurn,
              ),
              child: Column(
                children: [
                  appBar,
                  Divider(
                    height: 0,
                    color: Palette.charcoalGrey.withValues(alpha: .3),
                  ),
                  SizedBox(
                    height: 37,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          infoText!,
                          style: AppTextStyles.titleItalic12,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
