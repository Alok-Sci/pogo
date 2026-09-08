import 'package:flutter/material.dart';
import 'package:pogo/core/constants/app_images.dart';

class LoaderWidget extends StatefulWidget {
  final Duration duration;

  const LoaderWidget({
    super.key,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<LoaderWidget> createState() => _LoaderWidgetState();
}

class _LoaderWidgetState extends State<LoaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Image.asset(AppImages.loader,),
    );
  }
}