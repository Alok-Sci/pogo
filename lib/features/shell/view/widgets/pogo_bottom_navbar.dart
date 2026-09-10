import 'package:flutter/material.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/features/shell/view/widgets/call_chat_pill.dart';
import 'package:pogo/features/shell/view/widgets/pogo_navigation_pill.dart';

class PogoBottomNavbar extends StatelessWidget {
  const PogoBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onCallChatTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onCallChatTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PogoNavigationPill(currentIndex: currentIndex, onTap: onTap),
        AppSpacing.lg.hGap,
        CallChatPill(onTap: onCallChatTap),
      ],
    );
  }
}
