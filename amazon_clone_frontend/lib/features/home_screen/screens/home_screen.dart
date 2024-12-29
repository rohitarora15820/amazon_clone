import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../../providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String screenName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    height: 42,
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                          onTap: () {},
                          child:const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 23,
                          ),
                        ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide(
                                color: Colors.black38,
                                width: 1
                              )
                          ),
                          hintText: "Search Amazon.in",
                          hintStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          )
                        ),
                      ),
                    )),
              ),
              Container(
                  height: 42,
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.mic,color: Colors.black,
                size: 25,),
              )

            ],
          ),
        ),
      ),
      body: Center(
        child: Text(user.toJson()),
      ),
    );
  }
}
