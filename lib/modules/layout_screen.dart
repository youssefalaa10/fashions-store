import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../shared/app_color.dart';
import 'Home/home_screen.dart';
import 'categories/categories_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const CategoriesScreen(),
      const Scaffold(body: Center(child: Text('Screen 3'))),
      const Scaffold(body: Center(child: Text('Screen 4'))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        opacity: 0.7,
        activeColorPrimary: AppColor.blackColor,
        inactiveColorPrimary: AppColor.greyColor,
        activeColorSecondary: AppColor.whiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: "Cart",
        opacity: 0.7,
        activeColorPrimary: AppColor.blackColor,
        inactiveColorPrimary: AppColor.greyColor,
        activeColorSecondary: AppColor.whiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: "Notification",
        opacity: 0.7,
        activeColorPrimary: AppColor.blackColor,
        inactiveColorPrimary: AppColor.greyColor,
        activeColorSecondary: AppColor.whiteColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        opacity: 0.7,
        activeColorPrimary: AppColor.blackColor,
        inactiveColorPrimary: AppColor.greyColor,
        activeColorSecondary: AppColor.whiteColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}
