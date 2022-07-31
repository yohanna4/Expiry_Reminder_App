import 'package:expiry_reminder/provider/theme_provider.dart';
import 'package:expiry_reminder/screens/addItem/add_item.dart';
import 'package:expiry_reminder/screens/notificaion/notification.dart';
import 'package:expiry_reminder/screens/profile/profile_screen.dart';
import 'package:expiry_reminder/widgets/changeThemeButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Expiry Reminder",
            // style: TextStyle(fontFamily: fontf),
          ),
          iconTheme: Theme.of(context).iconTheme,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            ChangeThemeButtonWidget(),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              icon: const Icon(Icons.person),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text(
            "+",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 124, 61, 200),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddItemScreen()));
          },
        ),
        body: Column(children: [
          Text(
            "hiiiii ",
            style: TextStyle(
              color: Theme.of(context).iconTheme.color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]));
  }
}
