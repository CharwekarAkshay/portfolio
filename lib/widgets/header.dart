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
  bool _showAppbar = true;
  bool _isScrollingDown = false;

  _handleScrollingDirection(ScrollDirection? direction) {
    if (direction != null) {
      if (direction == ScrollDirection.reverse) {
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
    var size = MediaQuery.of(context).size;
    return Consumer<GeneralProvider>(
      builder: (context, generalProvider, _) {
        _handleScrollingDirection(generalProvider.scrollDirection);
        return AnimatedContainer(
          height: _showAppbar ? 70 : 0.0,
          duration: headerDuration,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            child: FadeInDown(
              delay: headerAnimationDelayDuration,
              child: size.width > smallDesktopScreenMin
                  ? const FullScreenHeader()
                  : MobileHeader(
                      showAppBar: _showAppbar,
                    ),
            ),
          ),
        );
      },
    );
  }
}

class MobileHeader extends StatelessWidget {
  const MobileHeader({
    Key? key,
    required this.showAppBar,
  }) : super(key: key);

  final bool showAppBar;

  _handleMenuPress(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey =
        Provider.of<GeneralProvider>(context, listen: false).scaffoldKey;
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          userFirstName,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: linkTextColor,
              ),
        ),
        if (showAppBar)
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _handleMenuPress(context),
            iconSize: 30,
            color: themeColor,
          )
      ],
    );
  }
}

class FullScreenHeader extends StatelessWidget {
  const FullScreenHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AnimatedLogo(),
        const Spacer(),
        ...links
            .map(
              (headerLink) => HeaderLink(
                headerLink: headerLink,
              ),
            )
            .toList(),
        AnimatedButton(
          text: 'Resume',
          onTap: () {},
        ),
      ],
    );
  }
}
