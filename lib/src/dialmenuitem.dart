import 'package:flutter/material.dart';
import 'dialmenu.dart';

class DialMenuItem extends StatelessWidget {
  DialMenuItem({Key key, this.leading, this.trailing}) : super(key: key);

  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[leading, trailing],
    );
  }
}

class DialMenuButton extends StatelessWidget {
  DialMenuButton(
      {Key key,
      this.label,
      @required this.tooltip,
      this.foregroundColor,
      this.backgroundColor,
      @required this.icon,
      @required this.onPressed,
      @required this.controller})
      : super(key: key);

  final String label;
  final String tooltip;
  final Color foregroundColor;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback onPressed;
  final DialMenuController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: DialMenuItem(
          leading: (label != null)
              ? Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    label,
                    textScaleFactor: 1.5,
                  ))
              : Container(),
          trailing: FloatingActionButton(
            heroTag: tooltip,
            tooltip: tooltip,
            foregroundColor:
                (foregroundColor != null) ? foregroundColor : Colors.white,
            backgroundColor:
                (backgroundColor != null) ? backgroundColor : Colors.lightBlue,
            child: Icon(
              icon,
              size: 25.0,
            ),
            onPressed: () {
              onPressed();
              controller.toggleMenu();
            },
          ),
        ));
  }
}
