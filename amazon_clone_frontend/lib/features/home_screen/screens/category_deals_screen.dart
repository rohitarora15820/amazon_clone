import 'package:amazon_clone_frontend/common/widgets/loader.dart';
import 'package:amazon_clone_frontend/features/home_screen/services/home_services.dart';
import 'package:flutter/material.dart';

import '../../../constants/global_variables.dart';
import '../../../models/product_model.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String screenName = "/category-deals";
  final String category;
  const CategoryDealsScreen({super.key, required this.category});

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  final HomeServices homeServices = HomeServices();
  List<ProductModel>? products = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCategoryProducts();
  }

  void fetchCategoryProducts() async {
    products = await homeServices.fetchCategoryProducts(
        context: context, category: widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Text(
              widget.category,
              style: const TextStyle(
                color: Colors.black,
              ),
            )),
      ),
      body: products == null
          ? Loader()
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Keep shopping for ${widget.category}",
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 170,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 15),
                    shrinkWrap: true,
                    itemCount: products!.length,
                    gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.4,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final productData = products![index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 130,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black12, width: 0.5)),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Image.network(productData.images[0]),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(
                              left: 0,
                              top: 5,
                              right: 15,

                            ),
                            child: Text(productData.name,
                            maxLines: 1,overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}
