import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/shared/widgets/circular_icon_button.dart';

class PogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PogoAppBar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
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
  }
}
