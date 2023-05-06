import 'package:flutter/material.dart';
import 'package:shopping_cart_tom/constants/app_theme.dart';
import 'package:shopping_cart_tom/providers/cart_provider.dart';
import 'package:shopping_cart_tom/providers/coupons_provider.dart';
import 'package:shopping_cart_tom/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_tom/providers/theme_provider.dart';
import 'package:shopping_cart_tom/screens/main_screen.dart';
import 'package:shopping_cart_tom/screens/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CouponsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'E- Commerce TOM',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeProvider.themeMode,
            routes: {
              ProductDetailsScreen.routeName: (ctx) => const ProductDetailsScreen(),
            },
            home: const MainScreen(),
          );
        }
      ),
    );
  }
}
