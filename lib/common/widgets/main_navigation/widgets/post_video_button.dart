import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
    required this.onTapDown,
    required this.inverted,
  });

  final bool onTapDown;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return AnimatedScale(
      scale: onTapDown ? 1.2 : 1.0,
      duration: const Duration(milliseconds: 150),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 20,
            child: Container(
              height: 30,
              width: 25,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: onTapDown
                    ? Theme.of(context).primaryColor
                    : const Color(0xff61d4f0),
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              height: 30,
              width: 25,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size8,
              ),
              decoration: BoxDecoration(
                color: onTapDown
                    ? const Color(0xff61d4f0)
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(
                  Sizes.size8,
                ),
              ),
            ),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size12,
            ),
            decoration: BoxDecoration(
              color: !inverted || isDark ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(
                Sizes.size6,
              ),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: !inverted || isDark ? Colors.black : Colors.white,
                size: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
