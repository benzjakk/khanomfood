import 'package:flutter/material.dart';

class SelectorBar {
  List<String> menuText;
  List<Color> selectedColors;
  SelectorBar(this.menuText);
  PageController pageController = PageController();
  void UpdatePageController(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void UpdateSelectedColors(List<Color> selectedColors) {
    this.selectedColors = selectedColors;
  }

  PageController GetPagecontroller() {
    return pageController;
  }

  List<Container> GetMenuList() {
    int n = menuText.length;
    List<Container> result = [];
    for (int i = 0; i < n; i++) {
      result.add(Container(
        width: 80,
        height: 20,
        child: FlatButton(
          onPressed: () {
            UpdatePageController(i);
          },
          child: Text(
            menuText[i],
            style: TextStyle(
                fontFamily: 'supermarket',
                fontSize: 15,
                color: selectedColors[i]),
          ),
        ),
      ));
    }
    return result;
  }

  Container DisplaySelectorBar() {
    return Container(
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: GetMenuList()),
    );
  }
}
