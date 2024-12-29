import 'package:amazon_clone_frontend/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            AccountButton(text: "Your Orders",onPressed: (){},),
            AccountButton(text: "Turn Sellers",onPressed: (){},),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(text: "Log Out",onPressed: (){},),
            AccountButton(text: "Your WishList",onPressed: (){},),
          ],
        ),
      ],
    );
  }
}
