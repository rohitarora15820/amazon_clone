import 'package:amazon_clone_frontend/constants/global_variables.dart';
import 'package:amazon_clone_frontend/features/account/widgets/below_appbar.dart';
import 'package:amazon_clone_frontend/features/account/widgets/order_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient
            ),

          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/amazon_in.png',
                width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: const Row(
                  children: [
                    Padding(padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search_outlined)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
          SizedBox(
            height: 20,
          ),
          OrderScreen()
        ],
      ),
    );
  }
}
