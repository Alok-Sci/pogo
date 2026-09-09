import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_icons.dart';
import 'package:pogo/core/constants/app_radii.dart';
import 'package:pogo/core/theme/app_palette.dart';
import 'package:pogo/core/theme/app_spacing.dart';
import 'package:pogo/core/theme/app_text_styles.dart';
import 'package:pogo/core/utils/num_extensions.dart';
import 'package:pogo/shared/widgets/app_icon.dart';
import 'package:pogo/shared/widgets/primary_button.dart';

class SwipeToContinueButton extends StatefulWidget {
  const SwipeToContinueButton({
    super.key,
    required this.onSwipeComplete,
    this.label = "Get Started",
    this.hintText = "Swipe to Continue!",
    this.height = 50.0,
  });

  final VoidCallback onSwipeComplete;
  final String label;
  final String hintText;
  final double height;

  @override
  State<SwipeToContinueButton> createState() => _SwipeToContinueButtonState();
}

class _SwipeToContinueButtonState extends State<SwipeToContinueButton>
    with SingleTickerProviderStateMixin {
  final GlobalKey _thumbKey = GlobalKey();
  double _thumbWidth = 0.0;

  double _dragX = 0;
  bool _completed = false;
  late final AnimationController _snapBackController;

  static const _trackHeight = 25.0 + (AppSpacing.sm * 2);

  @override
  void initState() {
    super.initState();
    _snapBackController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => _measureThumbSize());
  }

  @override
  void dispose() {
    _snapBackController.dispose();
    super.dispose();
  }

  void _measureThumbSize() {
    final renderBox = _thumbKey.currentContext?.findRenderObject();
    if (renderBox != null && mounted) {
      setState(() {
        _thumbWidth = renderBox.paintBounds.size.width;
      });
    }
  }

  void _onDragUpdate(DragUpdateDetails details, double maxDrag) {
    setState(() {
      _dragX = (_dragX + details.delta.dx).clamp(0.0, maxDrag);
    });
  }

  void _onDragEnd(double maxDrag) {
    final threshold = maxDrag * 0.85;
    if (_dragX >= threshold) {
      setState(() => _completed = true);
      widget.onSwipeComplete();
    } else {
      _animateSnapBack();
    }
  }

  void _animateSnapBack() {
    final animation = Tween<double>(begin: _dragX, end: 0).animate(
      CurvedAnimation(parent: _snapBackController, curve: Curves.easeOut),
    );

    animation.addListener(() {
      setState(() {
        _dragX = animation.value;
      });
    });

    _snapBackController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: LayoutBuilder(builder: (context, constraints) {
        // calculate drag limit
        final maxDrag =
            constraints.maxWidth - _thumbWidth - (AppSpacing.sm * 2);

        return GestureDetector(
          onHorizontalDragUpdate:
              _completed ? null : (details) => _onDragUpdate(details, maxDrag),
          onHorizontalDragEnd: _completed ? null : (_) => _onDragEnd(maxDrag),
          child: Container(
            height: _trackHeight,
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: Palette.dark,
              borderRadius: BorderRadius.circular(AppRadii.full),
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                if (!_completed)
                  Padding(
                    padding: EdgeInsets.only(left: _thumbWidth + AppSpacing.sm),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.hintText,
                          style: AppTextStyles.bodyMedium14,
                        ),
                        AppSpacing.huge.hGap,
                        AppIcon(
                          AppIcons.paginationArrows,
                          size: 16,
                          color: Palette.warmOffWhite,
                        ),
                      ],
                    ),
                  ),
                AnimatedPositioned(
                  duration: Duration.zero,
                  left: _dragX,
                  child: PrimaryButton(
                    key: _thumbKey,
                    widget.label,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
