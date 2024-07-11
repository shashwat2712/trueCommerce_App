import 'package:amazon_clone_node_js_flutter_app_new/common/widgets/bottom_bar.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/address/screens/address_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/admin/screens/add_product_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/home/screens/category_deals_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/home/screens/home_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/order_detail_screen/screens/order_details_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/product_details/screens/product_details_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/search/screens/search_screen.dart';
import 'package:amazon_clone_node_js_flutter_app_new/models/order.dart';
import 'package:amazon_clone_node_js_flutter_app_new/models/product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case OrderDetailScreen.routeName:
      var order = routeSettings.arguments as Order;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => OrderDetailScreen(order: order),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AddProductScreen(),
      );
    case ProductDetailsScreen.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsScreen(
          product: product,
        ),
      );
    case AddressScreen.routeName:
      var totalAmount = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddressScreen(totalAmount: totalAmount,),
      );
    case SearchScreen.routeName:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    case CategoryDealsScreen.routeName:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => CategoryDealsScreen(category: category),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );

  }
}





















