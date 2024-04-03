import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/feature/feature_product/presentation/bloc/all_poducts_cubit/all_products_cubit.dart';
import '../../../../common/arguments/productsArgument.dart';
import '../../../../locator.dart';
import '../widgets/products_grid.dart';

class AllProductsScreen extends StatelessWidget {
  static const routeName = '/all_product_screen';

  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// get categoryId
    final arg = ModalRoute.of(context)!.settings.arguments as ProductsArguments;

    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) =>  AllProductsCubit(locator())),
      ],

      child: Scaffold(

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),

          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),

            title: const Text(
              'محصولات',

              style: TextStyle(color: Colors.black),
            ),

          ),

        ),

        body: ProductsGrid(categoryId: arg.categoryId, searchText: arg.searchTxt, sellerId: arg.sellerId),
      ),

    );

  }

}
