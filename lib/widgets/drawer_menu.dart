import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/screens.dart';
import 'widgets.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  _handleDrawerClose(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: scaffoldColor,
      elevation: 100,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding,
            vertical: defaultPadding / 2,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => _handleDrawerClose(context),
                    iconSize: 30,
                    color: themeColor,
                  )
                ],
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...links
                          .map(
                            (headerLink) => Container(
                              margin: const EdgeInsets.only(
                                bottom: defaultPadding,
                              ),
                              child: HeaderLink(
                                headerLink: headerLink,
                              ),
                            ),
                          )
                          .toList(),
                      AnimatedButton(
                        text: 'Resume',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ResumeScreen.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...socialLinks
                      .map(
                        (link) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2,
                          ),
                          child: SocialIconLink(
                            link: link,
                          ),
                        ),
                      )
                      .toList(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
