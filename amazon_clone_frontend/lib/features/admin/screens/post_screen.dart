import 'package:amazon_clone_frontend/common/widgets/loader.dart';
import 'package:amazon_clone_frontend/features/admin/screens/add_product_screen.dart';

import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../account/widgets/single_product.dart';
import '../services/admin_services.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<ProductModel>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    // TODO: implement initState
    fetchAllProducts();
    super.initState();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(ProductModel productModel, int index) {
    adminServices.deleteProduct(
        context: context,
        productModel: productModel,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddProductScreen.screenName);
          },
          tooltip: "Add a Product",
          child: const Icon(Icons.add),
        ),
        body: products == null
            ? const Loader()
            : products!.isEmpty
                ? const Center(
                    child: Text("No Products Found!."),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: products!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final productData = products![index];
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 140,
                              child: SingleProduct(
                                image: productData.images[0],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Text(
                                  productData.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                )),
                                IconButton(
                                    onPressed: () {
                                      deleteProduct(productData, index);
                                    },
                                    icon: const Icon(Icons.delete_outline))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ));
  }
}
