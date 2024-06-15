import 'package:flutter/material.dart';
import 'package:newapp/ground_page.dart';
import 'package:newapp/login_si/service.dart';
import 'package:newapp/widgets/TextFieldInput.dart';
import 'package:newapp/widgets/snackBar.dart';

class SignBox extends StatefulWidget {
  const SignBox({super.key, required this.boxName});
  final String boxName;

  @override
  State<SignBox> createState() => _SignBoxState();
}

class _SignBoxState extends State<SignBox> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController idController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool isloding = false;

  void signUpUser() async {
    String res = await AuthServices().signUpUser(
        email: emailController.text,
        password: passwordController.text,
        id: idController.text,
        name: nameController.text);

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
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color.fromARGB(255, 3, 84, 89),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(
                  73, 0, 0, 0), // Shadow color (with transparency)
              offset: Offset(1.0, 1.0), // Offset the shadow (x, y)
              blurRadius: 30.0, // Blur radius of the shadow
              spreadRadius: 1.0, // Spread radius of the shadow (optional)
            ),
          ]),
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
            height: 20,
          ),
          TextFieldInput(
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: nameController,
              hintText: 'User Name',
              textInputType: TextInputType.name),
          const SizedBox(
            height: 8,
          ),
          TextFieldInput(
              icon: const Icon(
                Icons.pin,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: idController,
              hintText: 'ID',
              textInputType: TextInputType.number),
          const SizedBox(
            height: 8,
          ),
          TextFieldInput(
              icon: const Icon(
                Icons.email,
                color: Color.fromARGB(255, 3, 84, 89),
              ),
              textEditingController: emailController,
              hintText: 'Email',
              textInputType: TextInputType.emailAddress),
          const SizedBox(
            height: 8,
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
          const SizedBox(
            height: 35,
          ),
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
              signUpUser();
              print(
                "signup",
              );
            },
            child: const Text(
              'create account',
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
    idController.dispose();
    nameController.dispose();
  }
}
