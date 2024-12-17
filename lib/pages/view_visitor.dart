import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:visitor_log/main.dart';

class ViewVisitors extends StatefulWidget {
  const ViewVisitors({super.key});

  @override
  State<ViewVisitors> createState() => _ViewVisitorsState();
}

class _ViewVisitorsState extends State<ViewVisitors> {
  List<Map<String, dynamic>> visitorData = [];
  bool isLoading = true;

  void fetchVisitors() async {
    Uri url = Uri.parse("https://log-app-demo-api.onrender.com/getvistors");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          visitorData =
              List<Map<String, dynamic>>.from(jsonDecode(response.body))
                  .reversed
                  .toList();
        });
        isLoading = false;
      } else {
        showMessage(context, "Failed to fetch visitors data", Colors.red);
        throw Exception("Failed to fetch visitors data");
      }
    } catch (e) {
      showMessage(context, "Failed to fetch visitors data", Colors.red);
      print("Error: $e");
    }
  }

  @override
  void initState() {
    fetchVisitors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: visitorData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        "${visitorData[index]["firstname"]} ${visitorData[index]["lastname"]}",
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        "Purpose: ${visitorData[index]["purpose"]}\nWhom to meet: ${visitorData[index]["whomToMeet"]}",
                        style: TextStyle(fontSize: 16),
                      ),
                      trailing: Text(
                        visitorData[index]["date"].toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
