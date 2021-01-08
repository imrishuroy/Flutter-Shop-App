import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';

import 'package:shop_app/widgets/products_grid.dart';

enum FilterOption { Favourites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;
  final List<Product> loadedProducts = [];

  @override
  Widget build(BuildContext context) {
    // final productsContainer =
    //     Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop App'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption selectedValue) {
              print(selectedValue);
              setState(() {
                if (selectedValue == FilterOption.Favourites) {
                  // do this
                  // productsContainer.showFavouritesOnly();
                  _showOnlyFavourites = true;
                } else {
                  // do that
                  // productsContainer.showAll();
                  _showOnlyFavourites = true;
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOption.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOption.All,
              ),
            ],
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
