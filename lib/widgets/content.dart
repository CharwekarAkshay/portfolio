import 'package:flutter/material.dart';
import 'package:portfolio/provider/general_provider.dart';
import 'package:provider/provider.dart';

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _scrollViewController =
        Provider.of<GeneralProvider>(context, listen: false)
            .scrollViewController;
    return SingleChildScrollView(
      controller: _scrollViewController,
      child: Container(
        color: Colors.lightGreen,
        height: 10010,
      ),
    );
  }
}
