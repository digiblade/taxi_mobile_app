import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiui/Components/Atoms/Alignments/SpaceAlignment.dart';
import 'package:taxiui/Components/Atoms/Buttons/solidButton.dart';
import 'package:taxiui/Components/Atoms/Inputs/roundedInputFiled.dart';
import 'package:taxiui/locationMapScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceAlignment(
                    verticalSpace: 32,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: const Text(
                      "Login to your Account",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SpaceAlignment(
                    verticalSpace: 32,
                  ),
                  RoundedInputField(
                    prefixIcon: Icons.email_outlined,
                    placeholder: "Enter your email",
                  ),
                  SpaceAlignment(
                    verticalSpace: 16,
                  ),
                  RoundedInputField(
                    prefixIcon: Icons.lock_outline,
                    obscureText: true,
                    placeholder: "Enter your password",
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forget password?"),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SolidButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => LocationMapScreen(),
                          ),
                        );
                      },
                      label: "Sign in",
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.orange[500],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
