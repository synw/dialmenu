import 'dart:async';
import 'package:flutter/material.dart';

class DialMenuController {
  StreamController _stateStream = StreamController<String>.broadcast();

  get stateStream => _stateStream.stream;

  dispose() {
    _stateStream.close();
  }

  toggleMenu() {
    _stateStream.sink.add("toggleMenu");
  }
}

class _DialMenuState extends State<DialMenu> {
  _DialMenuState(
      {@required this.children,
      @required this.controller,
      this.bottom,
      this.left,
      this.right,
      this.top}) {
    if (this.bottom == null && this.top == null) {
      this._bottom = 15.0;
    }
    if (this.right == null && this.left == null) {
      this._right = 15.0;
    }
  }

  final num bottom;
  final num top;
  final num right;
  final num left;
  num _bottom;
  num _top;
  num _right;
  num _left;
  final List<Widget> children;
  final DialMenuController controller;
  bool _isVisible = false;
  StreamSubscription _stateStreamSub;

  @override
  void initState() {
    _stateStreamSub = controller.stateStream.listen((event) {
      if (event == "toggleMenu") {
        toggleMenu();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _stateStreamSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget w;
    _isVisible
        ? w = Positioned(
            bottom: _bottom,
            right: _right,
            top: _top,
            left: _left,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: children,
            ))
        : w = Container();
    return w;
  }

  toggleMenu() {
    _isVisible = !_isVisible;
    setState(() {});
  }
}

class DialMenu extends StatefulWidget {
  DialMenu(
      {@required this.children,
      @required this.controller,
      this.bottom,
      this.left,
      this.right,
      this.top});

  final List<Widget> children;
  final DialMenuController controller;
  final num bottom;
  final num top;
  final num right;
  final num left;

  @override
  _DialMenuState createState() =>
      _DialMenuState(children: children, controller: controller);
}
