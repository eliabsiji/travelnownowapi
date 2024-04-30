// import 'package:flutter/cupertino.dart';
// ignore_for_file: unnecessary_import, dead_code

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reminderapp/helper/app_loading.dart';
import 'package:reminderapp/views/screens/reset_password.dart';
import 'package:reminderapp/views/screens/signup.dart';
import 'package:reminderapp/theme.dart';
import 'package:reminderapp/viewmodels/userlogin_viewmodel.dart';
import 'package:reminderapp/views/widgets/login_form.dart';
import 'package:reminderapp/views/widgets/primary_button.dart';

class LogInScreen extends StatelessWidget {
   LogInScreen({super.key});

 // Declare the TextEditingControllers at the class level
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final loginviewModel = Provider.of<LoginViewModel>(context);
   
      Map<String, IconData> iconMapping = {
        'person': Icons.person,
        'password': Icons.password,
      };


    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel(authRepository: null))
      ],
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: kDefaultPadding,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Text(
                      'Welcome',
                      style: titleText,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      height: 100,
                      child: Center(
                          child: Image.asset(
                        'images/login logo.png',
                      ))),
                       if (loginviewModel.isLoading) const CircularProgressIndicator(),
                        // Show error message if login fails
                        if (!loginviewModel.isLoading && viewModel.loginError != null)
                          Text(loginloginviewModel.loginError!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        // Show response message if login is successful
                        if (loginviewModel.response != null)
                          Text(loginviewModel.response!.toString(),
                            style: const TextStyle(color: Colors.green),
                          ),
                   Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: TextFormField(
                          // controller: ,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email Field required";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: const TextStyle(
                                color: kTextFieldColor,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: Colors.grey)),
                              fillColor: Colors.grey,
                              filled: false,
                              prefixIcon: Icon(iconMapping['person']!),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                              ),
                              suffixIcon: true
                                  ? IconButton(
                                      onPressed: () {
                                        // setState(() {
                                        //   _isObscure = !_isObscure;
                                        // });
                                      },
                                      icon:true
                                          ? const Icon(
                                              Icons.visibility_off,
                                              color: kTextFieldColor,
                                            )
                                          : const Icon(
                                              Icons.visibility,
                                              color: kPrimaryColor,
                                            ),
                                    )
                                  : null),
                        ),
                      ),
                                    
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ResetPasswordScreen()));
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: kZambeziColor,
                        fontSize: 14,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Builder(builder: (context) {
                    final authConttoller = Provider.of<LoginViewModel>(context);
                    return GestureDetector(
                      onTap: () => {
                       
                         
                      },
                      child: const SizedBox(
                        height: 49,
                        child: PrimaryButton(
                           buttonText: 'Log In',
                          // Construct login request with the entered username and password
                          Map<dynamic, dynamic> req = {
                            "email": name.text,
                            "password": password.text,
                          };
                          // Call the login method in the view model with the request
                          viewModel.login(req);
                         
                        ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'New to this app?',
                        style: subTitle,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: textButton.copyWith(
                            decorationThickness: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //   'Or log in with:',
                  //   style: subTitle.copyWith(color: kBlackColor),
                  // ),
                  const SizedBox(
                    height: 60,
                  ),
                 
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}



