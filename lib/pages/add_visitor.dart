import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:visitor_log/main.dart';

class AddVisitor extends StatelessWidget {
  AddVisitor({super.key});

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final purposeController = TextEditingController();
  final whomToMeetController = TextEditingController();

  Future<bool> sendVisitorData(String fname, lname, purpose, whomToMeet) async {
    Uri url = Uri.parse("https://log-app-demo-api.onrender.com/addvisitor");

    try {
      final response = await http.post(
        url,
        body: jsonEncode(<String, String>{
          "firstname": fname,
          "lastname": lname,
          "purpose": purpose,
          "whomToMeet": whomToMeet
        }),
        headers: <String, String>{"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to add visitor!");
      }
    } catch (e) {
      print("Error: $e");
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add Visitor",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: fnameController,
              decoration: InputDecoration(
                label: Text("First Name"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: lnameController,
              decoration: InputDecoration(
                label: Text("Last Name"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: purposeController,
              decoration: InputDecoration(
                label: Text("Purpose"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: whomToMeetController,
              decoration: InputDecoration(
                label: Text("Whom to meet"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: 225,
              height: 50,
              child: OutlinedButton(
                onPressed: () async {
                  String fname = fnameController.text;
                  String lname = lnameController.text;
                  String purpose = purposeController.text;
                  String whomToMeet = whomToMeetController.text;

                  bool valid = true;
                  if (fname.isEmpty) {
                    valid = false;
                    showMessage(
                        context, "Please enter first name!", Colors.red);
                  }
                  if (lname.isEmpty) {
                    valid = false;
                    showMessage(context, "Please enter last name!", Colors.red);
                  }
                  if (purpose.isEmpty) {
                    valid = false;
                    showMessage(context, "Please enter purpose of your visit!",
                        Colors.red);
                  }
                  if (whomToMeet.isEmpty) {
                    valid = false;
                    showMessage(context,
                        "Please enter whom do you intent to meet!", Colors.red);
                  }

                  if (valid) {
                    if (await sendVisitorData(
                        fname, lname, purpose, whomToMeet)) {
                      showMessage(
                          context,
                          "Visitor $fname $lname added successfully!",
                          Colors.green);
                    } else {
                      showMessage(
                          context, "Failed to add visitor!", Colors.red);
                    }
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
