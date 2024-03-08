import 'package:flutter/material.dart';
import 'package:physio_mobile/pages/profile_page_widget.dart';
import 'pages/home_page_widget.dart';
import 'pages/signin_page_widget.dart';
import 'pages/signup_page_widget.dart';
import 'pages/messagesPageWidget.dart';
import 'service/prefs_service.dart';

import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsService.init();
  runApp(const NavigationBarApp());
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    String? storedToken = PrefsService.getString('token');
    print('Stored Token: $storedToken');
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: storedToken != null ? NavigationExample() : SignInPageWidget(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.person)),
            label: 'Perfil',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: <Widget>[
        HomePageWidget(),
        ProfilePageWidget(),
        ChatPage(
          theme: theme,
          backarrow: false,
        ),

        /// Messages page
      ][currentPageIndex],
    );
  }
}
