import 'package:flutter/material.dart';
import 'package:visitor_log/main.dart';

bool validate(BuildContext context, String username, password) {
  bool valid = true;
  if (username.isEmpty) {
    valid = false;
    showMessage(context, "Please enter username!", Colors.red);
  }
  if (username.isEmpty) {
    valid = false;
    showMessage(context, "Please enter password!", Colors.red);
  }
  return valid;
}

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Admin Login",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                label: Text("Username"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 225,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;

                  if (validate(context, username, password)) {
                    if (username == "admin" && password == "12345") {
                      showMessage(context, "Successfully logged as Admin",
                          Colors.green);
                      Future.delayed(Duration(milliseconds: 200), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminMenu()),
                        );
                      });
                    } else {
                      showMessage(
                          context, "Wrong username or password!", Colors.red);
                    }
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecurityLogin extends StatelessWidget {
  SecurityLogin({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Security Login",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                label: Text("Username"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 225,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;

                  if (validate(context, username, password)) {
                    if (username == "sbce" && password == "sbce123") {
                      showMessage(context, "Successfully logged as Security",
                          Colors.green);
                      Future.delayed(Duration(milliseconds: 200), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecurityMenu()),
                        );
                      });
                    } else {
                      showMessage(
                          context, "Wrong username or password!", Colors.red);
                    }
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
