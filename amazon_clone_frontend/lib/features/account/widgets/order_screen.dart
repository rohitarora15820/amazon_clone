import 'package:amazon_clone_frontend/constants/global_variables.dart';
import 'package:amazon_clone_frontend/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List tempList = [
    "https://imgs.search.brave.com/6xJ36HhFCwW9YIJEUB1eJvhK8tmS6yP4H4hxlg3uJsY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTUw/NjA0MDMzL3Bob3Rv/L2FwcGxlLW1hY2Jv/b2stcHJvLXNlc3Np/b24tZm9yLWFwcGxl/LWJvb2themluZS10/YWtlbi1vbi1zZXB0/ZW1iZXItNS0yMDEx/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz1pR084V0JUY21E/RUEwWG9XUHM4b0tv/UXpqR2lGdnhEdFFn/T3RKQ0N3djh3PQ",
    "https://imgs.search.brave.com/6xJ36HhFCwW9YIJEUB1eJvhK8tmS6yP4H4hxlg3uJsY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTUw/NjA0MDMzL3Bob3Rv/L2FwcGxlLW1hY2Jv/b2stcHJvLXNlc3Np/b24tZm9yLWFwcGxl/LWJvb2themluZS10/YWtlbi1vbi1zZXB0/ZW1iZXItNS0yMDEx/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz1pR084V0JUY21E/RUEwWG9XUHM4b0tv/UXpqR2lGdnhEdFFn/T3RKQ0N3djh3PQ",
    "https://imgs.search.brave.com/6xJ36HhFCwW9YIJEUB1eJvhK8tmS6yP4H4hxlg3uJsY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTUw/NjA0MDMzL3Bob3Rv/L2FwcGxlLW1hY2Jv/b2stcHJvLXNlc3Np/b24tZm9yLWFwcGxl/LWJvb2themluZS10/YWtlbi1vbi1zZXB0/ZW1iZXItNS0yMDEx/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz1pR084V0JUY21E/RUEwWG9XUHM4b0tv/UXpqR2lGdnhEdFFn/T3RKQ0N3djh3PQ",
    "https://imgs.search.brave.com/6xJ36HhFCwW9YIJEUB1eJvhK8tmS6yP4H4hxlg3uJsY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTUw/NjA0MDMzL3Bob3Rv/L2FwcGxlLW1hY2Jv/b2stcHJvLXNlc3Np/b24tZm9yLWFwcGxl/LWJvb2themluZS10/YWtlbi1vbi1zZXB0/ZW1iZXItNS0yMDEx/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz1pR084V0JUY21E/RUEwWG9XUHM4b0tv/UXpqR2lGdnhEdFFn/T3RKQ0N3djh3PQ",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(color: GlobalVariables.selectedNavBarColor),
              ),
            ),
          ],
        ),

        // display Order List
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: tempList.length,
            itemBuilder: (context, index) {
              return SingleProduct(image: tempList[index]);
            },
          ),
        )
      ],
    );
  }
}
