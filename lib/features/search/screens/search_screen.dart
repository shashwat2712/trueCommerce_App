import 'package:amazon_clone_node_js_flutter_app_new/common/widgets/loader.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/home/widgets/address_box.dart';
import 'package:amazon_clone_node_js_flutter_app_new/features/search/services/search_services.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import '../../product_details/screens/product_details_screen.dart';
import '../widgets/searched_product.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? productList = [];
  final SearchServices searchServices = SearchServices();
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _page = 0;
  final int _pageSize = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSearchedProduct();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchSearchedProduct();
      }
    });
  }

  fetchSearchedProduct() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });

    var products = await searchServices.fetchSearchedProducts(
      context: context,
      searchQuery: widget.searchQuery,
      page: _page,
      pageSize: _pageSize,
    );
    setState(() {
      productList?.addAll(products);
      _isLoading = false;
      _page++;
    });
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return productList == null
        ? const Loader()
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 42,
                        margin: const EdgeInsets.only(left: 15),
                        child: Material(
                          borderRadius: BorderRadius.circular(7),
                          elevation: 1,
                          child: TextFormField(
                            onFieldSubmitted: navigateToSearchScreen,
                            decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                    left: 6,
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 23,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                top: 10,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.black38,
                                  width: 1,
                                ),
                              ),
                              hintText: 'Search Amazon.in',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 42,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child:
                          const Icon(Icons.mic, color: Colors.black, size: 25),
                    ),
                  ],
                ),
              ),
            ),
            body: productList == null
                ? const Loader()
                : Column(
                    children: [
                      const AddressBox(),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: productList!.length + (_isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == productList!.length) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ProductDetailsScreen.routeName,
                                  arguments: productList![index],
                                );
                              },
                              child: SearchedProduct(
                                product: productList![index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          );
  }
}
