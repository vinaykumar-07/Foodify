import 'package:example1/pages/account/account_page.dart';
import 'package:example1/pages/auth/sign_in_page.dart';
import 'package:example1/pages/home/main_food_page.dart';
import 'package:example1/utilites/colors.dart';
import 'package:flutter/material.dart';
import '../cart/cart_history.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List pages = [
    // main page of the app
    const MainFoodPage(),
    // signIn page of the app
    const SignInPage(),
    // user can see the cart history
    const CartHistory(),
    // user profile page of logged in user
    const AccountPage(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          onTap: onTapNav,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.archive,
                ),
                label: 'SignIn '),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                ),
                label: 'Cart History'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_sharp,
                ),
                label: 'Acount')
          ]),
    );
  }

  
}
