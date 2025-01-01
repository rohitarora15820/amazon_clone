import 'package:amazon_clone_frontend/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.pushNamed(context, AddProductScreen.screenName);
        },
        tooltip: "Add a Product",
      ),
      body: Center(
        child: Text("Products"),
      ),

    );
  }
}
