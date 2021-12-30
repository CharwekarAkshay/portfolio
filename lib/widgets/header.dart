import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../provider/general_provider.dart';
import '../provider/provider.dart';
import '../widgets/widgets.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool _isScrollingDown = false;

  _handleScrollingDirection(ScrollDirection? direction) {
    if (direction != null) {
      if (direction ==  ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          _showAppbar = false;
        }
      }

      if (direction == ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          _showAppbar = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralProvider>(
      builder: (context, generalProvider, _) {
        _handleScrollingDirection(generalProvider.scrollDirection);
        return AnimatedContainer(
          height: _showAppbar ? 70 : 0.0,
          duration: headerDuration,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            child: FadeInDown(
              delay: headerAnimationDelayDuration,
              child: Row(
                children: [
                  const AnimatedLogo(),
                  const Spacer(),
                  ...headerLinks
                      .map(
                        (headerLink) => HeaderLink(
                          headerLink: headerLink,
                        ),
                      )
                      .toList(),
                  AnimatedButton(
                    text: "Resume",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
