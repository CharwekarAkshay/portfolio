import 'package:flutter/material.dart';
import 'package:portfolio/widgets/skill_progress.dart';
import '../constants.dart';

class SkillSet extends StatelessWidget {
  const SkillSet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: skillSetList
          .map((skillSet) => SkillProgress(
                skillSet: skillSet,
              ))
          .toList(),
    );
  }
}
