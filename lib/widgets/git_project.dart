import 'package:flutter/material.dart';

import '../models/model.dart';

class GitProject extends StatelessWidget {
  final GitProjectModel gitProject;
  const GitProject({
    Key? key,
    required this.gitProject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blueAccent,
    );
  }
}
