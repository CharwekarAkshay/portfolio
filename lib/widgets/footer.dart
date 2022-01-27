import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _fontSize = 12;

    Future<void> _launchWebsite(String url) async {
      if (!await launch(
        url,
        forceSafariVC: false,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      )) {
        throw 'Could not launch $url';
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'This website is buit using ',
              maxLines: 2,
              maxFontSize: _fontSize,
            ),
            const FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              size: 80.00,
            )
          ],
        ),
        Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'Designed By',
                  maxFontSize: _fontSize,
                ),
                const SizedBox(width: defaultSizing / 2),
                AnimatedLink(
                  text: designerName,
                  onTap: () => _launchWebsite(designerWebsiteUrl),
                  disableHoverEffect: true,
                ),
              ],
            ),
            const SizedBox(width: defaultSizing),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  'Customized and Built by',
                  maxFontSize: _fontSize,
                ),
                const SizedBox(width: defaultSizing / 2),
                AnimatedLink(
                  text: developerName,
                  onTap: () => _launchWebsite(developerWebsireUrl),
                  disableHoverEffect: true,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
