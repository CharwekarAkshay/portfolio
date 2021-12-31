import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets.dart';

class ExperienceDetail extends StatelessWidget {
  final ExperienceModel experience;

  const ExperienceDetail({
    Key? key,
    required this.experience,
  }) : super(key: key);

  onCompanyNameClick() async {
    var url = experience.companyLink;
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: true,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding / 2,
        vertical: defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(experience.designation),
              const SizedBox(width: defaultSizing / 2),
              AnimatedLink(
                text: '@${experience.companyName}',
                onTap: onCompanyNameClick,
                disableHoverEffect: true,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 20,
                    ),
              )
            ],
          ),
          const SizedBox(height: defaultSizing / 4),
          Text(
            '${experience.startDate} - ${experience.endDate}',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: experienceTextColor, fontSize: 13),
          ),
          const SizedBox(height: defaultSizing),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
              ),
              child: ListView.builder(
                itemBuilder: (context, index) => ExpeirenceDetailPoint(
                  text: experience.workExperience[index],
                ),
                itemCount: experience.workExperience.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
