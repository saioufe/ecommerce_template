import 'package:ecommerce_template/ecommerce_icons_icons.dart';
import 'package:ecommerce_template/screens/cart-screen.dart';
import 'package:ecommerce_template/screens/categories-screen.dart';
import 'package:ecommerce_template/screens/home-screen.dart';
import 'package:ecommerce_template/screens/profile-screen.dart';
import 'package:ecommerce_template/screens/search-screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:persistent_bottom_nav_bar/models/persisten-bottom-nav-item.widget.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-bottom-nav-bar-styles.widget.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-nav-bar-scaffold.widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';
import 'package:badges/badges.dart';

//import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  //final List<Meal> favoriteMeals;
  //MainScreen(this.favoriteMeals);
  final int index;
  //static dynamic page = LoginScreen();
  MainScreen(this.index);
  static const routeName = '/main_Screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

void saif() {}

class _TabsScreenState extends State<MainScreen> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 4);
  }

  List<Widget> _buildScreens() {
    return [
      ProfileScreen(),
      CartScreen(),
      SearchScreen(),
      CategoriesScreen(),
      HomeScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        translucencyPercentage: 85,
        icon: Icon(EcommerceIcons.user),
        title: ("profile"),
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.grey,
        isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        translucencyPercentage: 85,
        icon: Badge(
          animationType: BadgeAnimationType.scale,
          badgeColor: Theme.of(context).primaryColor,
          animationDuration: Duration(milliseconds: 100),
          badgeContent: Container(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                '1',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              )),
          position: BadgePosition.topLeft(),
          child: Icon(EcommerceIcons.shopping_cart),
        ),
        title: ("cart"),
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.grey,
        isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        translucencyPercentage: 85,
        icon: Icon(EcommerceIcons.magnifying_glass),
        title: ("search"),
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.grey,
        isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        translucencyPercentage: 85,
        icon: Icon(EcommerceIcons.tag),
        title: ("categories"),
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.grey,
        isTranslucent: true,
      ),
      PersistentBottomNavBarItem(
        translucencyPercentage: 85,
        icon: Icon(EcommerceIcons.shop),
        title: ("Home"),
        activeColor: Theme.of(context).primaryColor,
        inactiveColor: Colors.grey,
        isTranslucent: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(

        //navBarHeight: 80,
        navBarCurveRadius: 15,
        iconSize: 22,
        navBarCurve: NavBarCurve.upperCorners,
        controller: _controller,
        screens: _buildScreens(),
        items:
            _navBarsItems(), // Redundant here but defined to demonstrate for other than custom style
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        onItemSelected: (int) {
          setState(
              () {}); // This is required to update the nav bar if Android back button is pressed
        },
        itemCount: 4,
        navBarStyle:
            NavBarStyle.style5 // Choose the nav bar style with this property
        );
  }
}