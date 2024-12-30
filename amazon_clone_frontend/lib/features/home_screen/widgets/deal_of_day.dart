import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding:const  EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            "Deal of the day",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          "https://imgs.search.brave.com/bekCL4QaO-1TtOTIjDCs4PX2VDqQlzVLTGcY7jOJNm4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTM1/ODU3MjM4MC9waG90/by9hcHBsZS1tYWNi/b29rLXByby5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9WFlG/MHRVWExjYTUxc3RI/MEQybHYzMlk5ZXlZ/T2dlNVVYX1RNNThj/azJrST0",
          fit: BoxFit.fitHeight,
          height: 235,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$2000',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          alignment: Alignment.topLeft,
          child: const Text(
            'MacBook Ultra Pro',
            style: TextStyle(fontSize: 18),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://imgs.search.brave.com/oUs_uRRkavTlmj669LM14xLWTEwrhDODk26Ns1gkB9k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L0p5/aEZaeEhyZlB6NmNq/ZEw5VUpMeWctMzIw/LTgwLmpwZw",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://imgs.search.brave.com/oUs_uRRkavTlmj669LM14xLWTEwrhDODk26Ns1gkB9k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L0p5/aEZaeEhyZlB6NmNq/ZEw5VUpMeWctMzIw/LTgwLmpwZw",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://imgs.search.brave.com/oUs_uRRkavTlmj669LM14xLWTEwrhDODk26Ns1gkB9k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L0p5/aEZaeEhyZlB6NmNq/ZEw5VUpMeWctMzIw/LTgwLmpwZw",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://imgs.search.brave.com/oUs_uRRkavTlmj669LM14xLWTEwrhDODk26Ns1gkB9k/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bW9zLmNtcy5mdXR1/cmVjZG4ubmV0L0p5/aEZaeEhyZlB6NmNq/ZEw5VUpMeWctMzIw/LTgwLmpwZw",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        )
      ],
    );
  }
}
