import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_bloc.dart';
import 'package:store/blocs/cart_bloc/cart_state.dart';
import 'package:store/pages/cart_page.dart';
import 'package:store/pages/home_page.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    Center(child: Text('Wishlist')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) {
              setState(() {
                selectedIndex = value;
              });
            },
            destinations: [
              const NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: _CartIcon(
                  itemCount: state.totalItems,
                  icon: Icons.shopping_cart_outlined,
                ),
                selectedIcon: _CartIcon(
                  itemCount: state.totalItems,
                  icon: Icons.shopping_cart,
                ),
                label: 'Cart',
              ),
              const NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                selectedIcon: Icon(Icons.favorite),
                label: 'Wishlist',
              ),
              const NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CartIcon extends StatelessWidget {
  final int itemCount;
  final IconData icon;

  const _CartIcon({
    required this.itemCount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0) {
      return Icon(icon);
    }

    return Badge(
      label: Text('$itemCount'),
      child: Icon(icon),
    );
  }
}