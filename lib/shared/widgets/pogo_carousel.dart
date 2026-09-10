import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PogoCarousel extends StatelessWidget {
  const PogoCarousel({
    super.key,
    required this.items,
    this.height = 316,
    this.initialPage = 1,
  });

  final double height;
  final int initialPage;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: height,
        aspectRatio: 16 / 9,
        viewportFraction: 0.78,
        initialPage: initialPage,
        enableInfiniteScroll: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
