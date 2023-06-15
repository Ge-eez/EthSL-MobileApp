import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../root_scaffold.dart';
import '../bloc/signUpBloc/signup_bloc.dart';
import '../bloc/signUpBloc/signup_event.dart';
import '../bloc/signUpBloc/signup_state.dart';
import '../data_provider/signup_dataprovider.dart';
import '../repository/signup_dataproviders.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static const String route = "/register";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formfield = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();

  final SignUpRepository _signUpRepository =
      SignUpRepository(signup_dataprovider: SignUpDataProvider());

  // String validateEmail(value) {
  //   if (value!.isEmpty) {
  //     return "Enter Email";
  //   }

  //   bool validEmail =
  //       RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
  //   if (!validEmail) {
  //     return "Enter Valid Email";
  //   }

  //   return "";
  // }

  // String validatePassword(value) {
  //   if (value!.isEmpty) {
  //     return "Enter Pasword";
  //   } else if (passwordController.text.length < 8) {
  //     return "Password length should be more than 8 character";
  //   }

  //   return "";
  // }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return RepositoryProvider.value(
      value: _signUpRepository,
      child: BlocProvider(
        create: (context) => SignUpBloc(signUpRepository: _signUpRepository),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 80, 20, 4),
              child: Form(
                  key: _formfield,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      // SizedBox(height: 20),

                      const Text('Sign Up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Color.fromRGBO(51, 53, 123, 1),
                          )),

                      SizedBox(height: screenHeight * 0.05),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: userNameController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            labelText: "User Name",
                            suffixIcon: Icon(Icons.check),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email";
                          }

                          bool validEmail =
                              RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                          if (!validEmail) {
                            return "Enter Valid Email";
                          }
                        },
                      ),

                      SizedBox(height: screenHeight * 0.04),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            labelText: "Password",
                            // suffixIcon: Icon(Icons.check),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            suffix: InkWell(
                              onTap: () {},
                              child: Text('Forgot?'),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Pasword";
                          } else if (passwordController.text.length < 8) {
                            return "Password length should be more than 8 character";
                          }
                        },
                      ),

                      SizedBox(height: screenHeight * 0.04),
                      TextFormField(
                      controller: emailController,
                      // Add other TextFormField properties...
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    TextFormField(
                      controller: firstNameController,
                      // Add other TextFormField properties...
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    TextFormField(
                      controller: lastNameController,
                      // Add other TextFormField properties...
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    TextFormField(
                      controller: phoneController,
                      // Add other TextFormField properties...
                    )


                      BlocConsumer<SignUpBloc, SignUpState>(
                        listener: (context, SignUpState) {
                          if (SignUpState is SignUpSuccessUser) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RootScaffold()));
                          }
                        },
                        builder: (context, SignUpState) {
                          Widget button = InkWell(
                            onTap: () {
                              // final form = _formfield.currentState;
                              if (_formfield.currentState!.validate()) {
                                print('success');
                                // userNameController.clear();
                                // passwordController.clear();

                                _formfield.currentState!.save();

                                BlocProvider.of<SignUpBloc>(context).add(
                                RegisterEvent(
                                  emailController.text,
                                  passwordController.text,
                                  firstNameController.text,
                                  lastNameController.text,
                                  userNameController.text,
                                  phoneController.text,
                                ),
                              );

                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromRGBO(51, 53, 123, 1),
                              ),
                              child: Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );

                          if (SignUpState is LoadingState) {
                            button = CircularProgressIndicator(
                              color: Colors.black,
                            );
                          }

                          if (SignUpState is SignUpFailed) {
                            try {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: SizedBox(
                                      height: 45,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.cancel,
                                              color: Colors.black),
                                          const SizedBox(width: 4),
                                          Text(SignUpState.errMsg,
                                              style: const TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ),
                                    duration: const Duration(seconds: 2),
                                    backgroundColor: Colors.red),
                              );
                            } catch (e) {}
                            ;
                          }

                          return button;
                        },
                      ),

                      SizedBox(height: screenHeight * 0.225),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
