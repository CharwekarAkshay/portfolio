import 'package:flutter/cupertino.dart';
class GeneralProvider with ChangeNotifier {
  late ScrollController _scrollViewController;

  GeneralProvider() {
    _scrollViewController = ScrollController();
  }


  get scrollViewController {
    return _scrollViewController;
  }
}