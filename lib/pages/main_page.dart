import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:panelapp/pages/accounts_page.dart';
import 'package:panelapp/pages/explore_page.dart';
import 'package:panelapp/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool _isScrollingDown = false;
  double _bottomNavHeight = 60;
  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController2 = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _scrollController2.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Determine which controller is currently active based on the selected tab
    ScrollController activeController = _currentIndex == 0 ? _scrollController : _scrollController2;

    if (activeController.position.userScrollDirection == ScrollDirection.reverse) {
      if (!_isScrollingDown) {
        setState(() {
          _isScrollingDown = true;
          _bottomNavHeight = 0;
        });
      }
    } else if (activeController.position.userScrollDirection == ScrollDirection.forward) {
      if (_isScrollingDown) {
        setState(() {
          _isScrollingDown = false;
          _bottomNavHeight = 60;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _scrollController2.removeListener(_scrollListener);
    _scrollController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomePage(scrollController: _scrollController),
          ExplorePage(scrollController: _scrollController2),
          const AccountsPage(),
        ],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _bottomNavHeight,
        child: Wrap(
          children: [
            BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
              fixedColor: Colors.red,
              elevation: 8,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.card_giftcard_rounded), label: 'Explore'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_box_rounded), label: 'Account'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}