import 'package:amazon_clone_frontend/common/widgets/custom_button.dart';
import 'package:amazon_clone_frontend/common/widgets/custom_textfield.dart';
import 'package:amazon_clone_frontend/contants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth { signIn, signUp }

class AuthScreen extends StatefulWidget {
  static const String screenName = "/auth_screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                tileColor: _auth == Auth.signUp
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)

              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariables.backgroundColor,child:  Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: "Name",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        title: "Sign Up",
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signIn
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text(
                  "Sign-In.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signIn)

                Container(
                  padding: EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,child:  Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [

                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        title: "Sign In",
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
