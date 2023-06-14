import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../root_scaffold.dart';
import '../bloc/signInBloc/signin_bloc.dart';
import '../bloc/signInBloc/signin_event.dart';
import '../bloc/signInBloc/signin_state.dart';
import '../data_provider/signin_dataprovider.dart';
import '../repository/signin_dataproviders.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const String route = "/sign";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formfield = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final SignInRepository _signInRepository =
      SignInRepository(signin_dataprovider: SignInDataProvider());

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
      value: _signInRepository,
      child: BlocProvider(
        create: (context) => SignInBloc(signInRepository: _signInRepository),
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

                      const Text('Sign In',
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

                      BlocConsumer<SignInBloc, SignInState>(
                        listener: (context, SignInState) {
                          if (SignInState is SignInSuccessUser) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RootScaffold()));
                          }
                        },
                        builder: (context, SignInState) {
                          Widget button = InkWell(
                            onTap: () {
                              // final form = _formfield.currentState;
                              if (_formfield.currentState!.validate()) {
                                print('success');
                                // userNameController.clear();
                                // passwordController.clear();

                                _formfield.currentState!.save();

                                BlocProvider.of<SignInBloc>(context).add(
                                    LogInEvent(userNameController.text,
                                        passwordController.text));
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
                                  "Sign In",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );

                          if (SignInState is LoadingState) {
                            button = CircularProgressIndicator(
                              color: Colors.black,
                            );
                          }

                          if (SignInState is SignInFailed) {
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
                                          Text(SignInState.errMsg,
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
