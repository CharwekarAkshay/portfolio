import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../models/model.dart';
import 'widgets.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }

  _sendMail(data) {
    var emailLaunchUri = Uri(
      scheme: 'mailto',
      path: userEmail,
      query: _encodeQueryParameters(<String, String>{
        'subject': data['subject'],
        'body': data['body'],
      }),
    );
    launch(emailLaunchUri.toString());
  }

  _openEmailDialog(context) async {
    var data = await showDialog(
      context: context,
      builder: (context) => EmailDialog(),
    );
    if (data != null) {
      _sendMail(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    LinkModel link = links[3];
    return ContentWrapper(
      child: Column(
        children: [
          AutoSizeText(
            '${link.textKey} What\'s next?',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 25,
                ),
          ),
          const SizedBox(height: defaultSizing),
          AutoSizeText(
            'Get In Touch ',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 50,
                ),
          ),
          const SizedBox(height: defaultSizing * 2),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: _getMessageBoxWidth(context),
            ),
            child: AutoSizeText(
              contactMessage,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 5,
            ),
          ),
          const SizedBox(height: defaultSizing * 2),
          AnimatedButton(
            text: 'Say Hello!',
            onTap: () => _openEmailDialog(context),
          ),
        ],
      ),
    );
  }

  _getMessageBoxWidth(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth >= extraLargeScreenMin) {
      return screenWidth * 0.4;
    } else if (screenWidth < extraLargeScreenMin &&
        screenWidth >= desktopScreenMin) {
      return screenWidth * 0.5;
    } else if (screenWidth < desktopScreenMin &&
        screenWidth >= smallDesktopScreenMin) {
      return screenWidth * 0.6;
    } else if (screenWidth < smallDesktopScreenMin &&
        screenWidth >= tabletScreenMin) {
      return screenWidth * 0.7;
    }else {
      return screenWidth;
    }
  }
}
