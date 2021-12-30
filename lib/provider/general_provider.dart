import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class GeneralProvider with ChangeNotifier {
  late ScrollDirection? _scrollDirection;
  double _scrolledPixel = 0;
  late ItemScrollController _itemScrollController;
  late ItemPositionsListener _itemPositionsListener;

  GeneralProvider() {
    _scrollDirection = null;
    _itemScrollController = ItemScrollController();
    _itemPositionsListener = ItemPositionsListener.create();
  }

  get itemScrollController {
    return _itemScrollController;
  }

  get itemPositionsListener {
    return _itemPositionsListener;
  }

  get scrollDirection {
    return _scrollDirection;
  }

  setScrollDirection(ScrollNotification notification) {
    if (_scrolledPixel > notification.metrics.pixels) {
      _scrollDirection = ScrollDirection.forward;
      _scrolledPixel = notification.metrics.pixels;
      notifyListeners();
    } else if (_scrolledPixel < notification.metrics.pixels) {
      _scrollDirection = ScrollDirection.reverse;  
      _scrolledPixel = notification.metrics.pixels;
      notifyListeners();
    }
  }
}
