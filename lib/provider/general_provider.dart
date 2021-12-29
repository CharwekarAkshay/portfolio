import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class GeneralProvider with ChangeNotifier {
  late ScrollController _scrollViewController;
  late ItemScrollController _itemScrollController;
  late ItemPositionsListener _itemPositionsListener;

  GeneralProvider() {
    _scrollViewController = ScrollController();
    _itemScrollController = ItemScrollController();
    _itemPositionsListener = ItemPositionsListener.create();
  }

  get scrollViewController {
    return _scrollViewController;
  }

  get itemScrollController {
    return _itemScrollController;
  }

  get itemPositionsListener {
    return _itemPositionsListener;
  }
}
