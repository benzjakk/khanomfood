import 'package:flutter/material.dart';

class SelectorBar {
  List<String> menuText;
  List<Color> selectedColors;
  SelectorBar(this.menuText);
  PageController pageController = PageController();
  void UpdatePageController(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  void UpdateSelectedColors(List<Color> selectedColors) {
    this.selectedColors = selectedColors;
  }

  PageController GetPagecontroller() {
    return pageController;
  }

  Container DisplaySelectorBar() {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: 80,
            height: 20,
            child: FlatButton(
              onPressed: () {
                UpdatePageController(0);
              },
              child: Text(
                menuText[0],
                style: TextStyle(
                    fontFamily: 'supermarket',
                    fontSize: 15,
                    color: selectedColors[0]),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 20,
            child: FlatButton(
              onPressed: () {
                UpdatePageController(1);
              },
              child: Text(
                menuText[1],
                style: TextStyle(
                    fontFamily: 'supermarket',
                    fontSize: 15,
                    color: selectedColors[1]),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 20,
            child: FlatButton(
              onPressed: () {
                UpdatePageController(2);
              },
              child: Text(
                menuText[2],
                style: TextStyle(
                    fontFamily: 'supermarket',
                    fontSize: 15,
                    color: selectedColors[2]),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 20,
            child: FlatButton(
              onPressed: () {
                UpdatePageController(3);
              },
              child: Text(
                menuText[3],
                style: TextStyle(
                    fontFamily: 'supermarket',
                    fontSize: 15,
                    color: selectedColors[3]),
              ),
            ),
          ),
          Container(
            width: 80,
            height: 20,
            child: FlatButton(
              onPressed: () {
                UpdatePageController(4);
              },
              child: Text(
                menuText[4],
                style: TextStyle(
                    fontFamily: 'supermarket',
                    fontSize: 15,
                    color: selectedColors[4]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
