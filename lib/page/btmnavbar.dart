import 'package:flutter/material.dart';
import 'package:uastpm/page/orders.dart';
import 'package:uastpm/page/profile.dart';
import 'dashboard.dart';
import 'promospage.dart';
class BtmNavBar extends StatefulWidget {
  const BtmNavBar({Key? key}) : super(key: key);

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  int _selectedIndex = 0;
  late PageController _pageController;

  static const Color customGreen = Color(0xFF01AD01);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
      _pageController.jumpToPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      Dashboard(),
      PromosPage(),
      OrdersPage(),
      ProfilePage(),
    ];

    return WillPopScope(
      onWillPop: () async {
        if (_pageController.page?.round() == 1) {
          _pageController.jumpToPage(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          physics: const NeverScrollableScrollPhysics(),
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: customGreen,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer, size: 30),
              label: 'Promos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history, size: 30),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
