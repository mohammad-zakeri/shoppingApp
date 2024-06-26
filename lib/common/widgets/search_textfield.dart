import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shopping_app/common/blocs/search_box_cubit.dart';
import 'package:shopping_app/feature/feature_product/data/models/all_products_model.dart';
import 'package:shopping_app/feature/feature_product/repositories/all_product_repository.dart';
import '../../../../common/params/products_params.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final AllProductsRepository allProductsRepository;
  const SearchTextField({super.key, required this.controller, required this.allProductsRepository});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SearchBoxCubit(),

      child: Builder(
        builder: (context) {

          return Material(

            child: Stack(
              alignment: AlignmentDirectional.center,

              children: [

                /// textfield
                SizedBox(
                  height: 40,

                  child: TypeAheadField(
                    controller: controller,

                    emptyBuilder: (context){
                      return const ListTile(
                        title: Text("محصولی یافت نشد."),
                      );
                    },

                    // textFieldConfiguration: TextFieldConfiguration(
                    //
                    //   onTap: () {
                    //     BlocProvider.of<SearchBoxCubit>(context).changeVisibility(false);
                    //
                    //     if (controller.text[controller.text.length - 1] != ' ') {
                    //       controller.text = (controller.text + ' ');
                    //     }
                    //     if (controller.selection ==TextSelection.fromPosition(
                    //         TextPosition(offset:
                    //         controller.text.length - 1))) {
                    //     }
                    //   },
                    //
                    //   onSubmitted: (String prefix) {
                    //     // Navigator.pushNamed(
                    //     //   context,
                    //     //   AllProductsScreen.routeName,
                    //     //   arguments: ProductsArguments(searchTxt: prefix),);
                    //   },
                    //
                    //   controller: controller,
                    //   style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
                    //   decoration: InputDecoration(
                    //     fillColor: Colors.grey.shade200,
                    //     filled: true,
                    //     contentPadding: EdgeInsets.all(3),
                    //     prefixIcon: Container(
                    //         child: IconButton(
                    //           icon: const Icon(Icons.search,color: Colors.grey,),
                    //           onPressed: () {
                    //             // Navigator.pushNamed(
                    //             //   context,
                    //             //   AllProductsScreen.routeName,
                    //             //   arguments: ProductsArguments(searchTxt: controller.text),);
                    //           },
                    //         )
                    //     ),
                    //     enabledBorder:OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       borderSide: const BorderSide(
                    //         color: Colors.transparent,
                    //         width: 0.0,
                    //       ),
                    //     ),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       borderSide: const BorderSide(
                    //         color: Colors.blue,
                    //         width: 0.0,
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(15.0),
                    //       borderSide: const BorderSide(
                    //         color: Colors.blue,
                    //         width: 2.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),

                    suggestionsCallback: (String prefix){
                      return allProductsRepository.fetchAllProductsDataSearch(ProductsParams(step: 6,search: prefix));
                    },

                    itemBuilder: (context, Products model){
                      return ListTile(
                        title: Text(model.name!,style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400)),
                      );
                    },

                    onSelected: (Products products) {
                      controller.text = products.name!;
                      // Navigator.pushNamed(
                      //   context,
                      //   AllProductsScreen.routeName,
                      //   arguments: ProductsArguments(searchTxt: products.name!),);
                    },

                  ),

                ),
    
                /// text and logo
                IgnorePointer(

                  child: BlocBuilder<SearchBoxCubit, bool>(
                    builder: (context, state) {

                      return Visibility(
                        visible: state,

                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),

                          child: Row(
                            children: [

                              const Text('جستوجو در', style: TextStyle(fontSize: 17, fontFamily: "Yekan", color: Colors.grey, fontWeight: FontWeight.w200)),

                              ColorFiltered(
                                colorFilter: ColorFilter.mode(Colors.grey.shade800, BlendMode.srcIn),
                                child: Image.asset("assets/images/bs_logo_textfield.png", height: 28),
                              ),

                            ],
                          ),

                        ),

                      );

                    },

                  ),

                ),

              ],
            ),

          );

        },

      ),

    );

  }

}
