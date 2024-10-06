import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/login_example/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
              controller: emailController,
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Password",
              ),
              controller: passwordController,
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FilledButton(
              onPressed: () {
                loginProvider.login(emailController.text, passwordController.text);
              },
              child: loginProvider.loading ? CircularProgressIndicator() : Text("Login"),
            ),
          )

        ],
      ),
    );
  }
}
