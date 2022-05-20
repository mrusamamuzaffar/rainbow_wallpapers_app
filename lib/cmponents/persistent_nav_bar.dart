// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:rainbow/pages/main_page.dart';
import 'package:rainbow/pages/searchpage.dart';
import 'package:rainbow/pages/settings.dart';
import 'package:rainbow/pages/upload.dart';

class persistent_navbar extends StatelessWidget {
  const persistent_navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return PersistentTabView(
      context,
  
      screens: _buildScreens(),
      controller: _controller,
      items: _navBarsItems(),

      confineInSafeArea: true,
      backgroundColor: Colors.black, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true,
           // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 150),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
 List<Widget> _buildScreens() {
      return [
      MainPage(),
      SearchPage(),
      upload(),
      settings(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          title: ("Search"),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.add_circle),
          title: ("Add"),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary: CupertinoColors.white,
          inactiveColorPrimary: CupertinoColors.white,
        ),
      ];
    }

    final _controller = PersistentTabController(initialIndex: 0);