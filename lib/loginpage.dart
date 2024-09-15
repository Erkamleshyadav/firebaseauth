import 'package:demo_class/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthLogin extends StatelessWidget {
  const AuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();

    // Future<void> signUp(email, password) async {
    //   try {
    //     UserCredential userCredential =
    //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: email,
    //       password: password,
    //     );
    //     print("User signed up:$email");
    //     print("User signed up:$password");
    //   } on FirebaseAuthException catch (e) {
    //     print("Error: $e");
    //   }
    // }

    Future<void> singIn() async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailC.text, password: passwordC.text);
      } on FirebaseAuthException catch (e) {
        print('error');
      }
    }

    return Scaffold(
      // backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Card(
              child: Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: emailC,
                          decoration:
                              InputDecoration(border: OutlineInputBorder())),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passwordC,
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       // signUp(email, password);
            //     },
            //     child: Text('submit')),
            ElevatedButton(onPressed: (() => singIn()), child: Text('singIn'))
          ],
        ),
      ),
    );
  }
}
