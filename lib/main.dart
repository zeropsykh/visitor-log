import 'package:flutter/material.dart';
import 'package:visitor_log/pages/add_visitor.dart';
import 'package:visitor_log/pages/login.dart';
import 'package:visitor_log/pages/view_visitor.dart';

void main() {
  runApp(const VisitorLogApp());
}

class VisitorLogApp extends StatefulWidget {
  const VisitorLogApp({super.key});

  @override
  State<VisitorLogApp> createState() => _VisitorLogAppState();
}

class _VisitorLogAppState extends State<VisitorLogApp> {
  final List<Widget> pages = [SecurityLogin(), AdminLogin()];
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SBCE Visitor Log"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: pages[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              label: "Security",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings),
              label: "Admin",
            ),
          ],
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
      ),
    );
  }
}

class SecurityMenu extends StatefulWidget {
  const SecurityMenu({super.key});

  @override
  State<SecurityMenu> createState() => _SecurityMenuState();
}

class _SecurityMenuState extends State<SecurityMenu> {
  List<Widget> pages = [AddVisitor(), ViewVisitors()];
  int _selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SBCE VisitorLog"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: pages[_selectedMenu],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_outlined),
              label: "Add",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_headline_outlined),
              label: "View",
            ),
          ],
          currentIndex: _selectedMenu,
          onTap: (int index) {
            setState(() {
              _selectedMenu = index;
            });
          },
        ),
      ),
    );
  }
}

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SBCE VisitorLog"),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
        body: ViewVisitors(),
      ),
    );
  }
}

void showMessage(BuildContext context, String message, Color c) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: c,
      duration: Duration(seconds: 1),
    ),
  );
}
