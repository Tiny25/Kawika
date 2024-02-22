import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel/Provider/LoginProvider.dart';
import 'package:provider/provider.dart';
import 'package:travel/WelcomePage/SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = '/Login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var email = "";
  var password = "";
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool didPop) {
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 15, left: 40, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorColor: Colors.black,
                                onChanged: (text) {
                                  email = text;
                                },
                                validator: (text) {
                                  RegExp regex = RegExp(
                                      r'^[a-zA-Z][a-zA-Z.]*@asirtech\.com$');
                                  if (text!.isEmpty) {
                                    return 'Please enter some text';
                                  } else if (!(regex.hasMatch(text))) {
                                    return 'Enter a valid email';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 5.0),
                                  fillColor: Color.fromARGB(255, 242, 242, 242),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Enter email',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 0, left: 40, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                cursorColor: Colors.black,
                                obscureText: passwordVisibility,
                                onChanged: (text) {
                                  password = text;
                                },
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'Please enter some text';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                    borderSide: BorderSide.none,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  fillColor:
                                      const Color.fromARGB(255, 242, 242, 242),
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Enter password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisibility
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                    ),
                                    color: Colors.black,
                                    onPressed: () => setState(() {
                                      passwordVisibility = !passwordVisibility;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, right: 30),
                        child: TextButton(
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color.fromARGB(255, 48, 184, 208)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(SignUp.routeName,
                                arguments: {'isSignUp': true});
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 48, 184, 208),
                    ),
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          login(context, email, password);
                        }
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color.fromARGB(255, 48, 184, 208),
                          fontSize: 18.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignUp.routeName,
                          arguments: {'isSignUp': false});
                    },
                  )
                ],
              ),
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }

  login(context, email, password) {
    Provider.of<LoginProvider>(context, listen: false)
        .login(context, email, password);
  }
}
