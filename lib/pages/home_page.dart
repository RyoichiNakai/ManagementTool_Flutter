import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:management/pages/todolists/index_todolist_section_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          IndexToDoListSectionPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: [
          _buildBottomNavigationBarItem(Icon(Icons.home), 'TodoList'),
          _buildBottomNavigationBarItem(Icon(Icons.settings), 'TodoList'),
          _buildBottomNavigationBarItem(Icon(Icons.money_off), 'Expense')
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(Icon icon, String text) {
    return BottomNavigationBarItem(
        icon: icon,
        title: Text(text)
    );
  }
}