import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/provider/general_provider.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool _isScrollingDown = false;

  @override
  void initState() {
    _scrollViewController = Provider.of<GeneralProvider>(context, listen: false).scrollViewController;
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollingDown) {
          _isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollingDown) {
          _isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: _showAppbar ? 56.0 : 0.0,
      duration: Duration(milliseconds: 200),
      child: AppBar(
        title: Text('Scroll'),
        actions: <Widget>[
          //add buttons here
        ],
      ),
    );
  }
}
