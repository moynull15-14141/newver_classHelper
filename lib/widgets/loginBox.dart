import 'package:flutter/material.dart';
import 'package:newapp/HomePage.dart';
import 'package:newapp/login_si/service.dart';
import 'package:newapp/widgets/TextFieldInput.dart';
import 'package:newapp/widgets/snackBar.dart';

class LoginBox extends StatefulWidget {
  const LoginBox({super.key, required this.boxName});
  final String boxName;

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  bool isloding = false;
  void loginUser() async {
    String res = await AuthServices().loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    if (res == "success") {
      setState(() {
        isloding = true;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Ground(),
          ),
        );
      });
    } else {
      setState(
        () {
          isloding = false;
        },
      );

      showSnackbar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      width: 310,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(
                  73, 0, 0, 0), // Shadow color (with transparency)
              offset: Offset(1.0, 1.0), // Offset the shadow (x, y)
              blurRadius: 30.0, // Blur radius of the shadow
              spreadRadius: 1.0, // Spread radius of the shadow (optional)
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(255, 3, 84, 89)),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 310,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Color.fromARGB(255, 7, 123, 130),
            ),
            child: Center(
              child: Text(
                widget.boxName,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextFieldInput(
            icon: const Icon(
              Icons.email,
              color: Color.fromARGB(255, 3, 84, 89),
            ),
            textEditingController: emailController,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 30,
          ),
          TextFieldInput(
              isPass: true,
              icon: const Icon(
                Icons.password,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: passwordController,
              hintText: 'Password',
              textInputType: TextInputType.visiblePassword),
          const Padding(
            padding: EdgeInsets.only(right: 14),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgote Passoword?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),

          //// new elevated buton style syntext update . remember it and dont forgate.
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: WidgetStateProperty.all<Size>(const Size(200.0, 50.0)),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      5), // Set your desired radius value here (e.g., 10.0, 20.0)
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 7, 123, 130)),
            ),
            onPressed: () {
              loginUser();
            },
            child: const Text(
              'Login',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Font2', fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  void dspose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
