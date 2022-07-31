import 'package:expiry_reminder/screens/addItem/add_item.dart';
import 'package:expiry_reminder/screens/changePassword/change_password.dart';
import 'package:expiry_reminder/screens/changePassword/password_changed.dart';
import 'package:expiry_reminder/screens/forgotPassword/forgot_password.dart';
import 'package:expiry_reminder/screens/home/home.dart';
import 'package:expiry_reminder/screens/login/login.dart';
import 'package:expiry_reminder/screens/notificaion/notification.dart';
import 'package:expiry_reminder/screens/notificaion/notification_detail.dart';
import 'package:expiry_reminder/screens/otpConfirmation/otp_confirmation.dart';
import 'package:expiry_reminder/screens/profile/profile_screen.dart';
import 'package:expiry_reminder/screens/register/register.dart';
import 'package:expiry_reminder/widgets/changeThemeButton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart ';
import 'package:expiry_reminder/provider/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyARIq8GQ9dyEWdJRJRZ-ERR-mMBnGpYiss",
      appId: "1:393268087308:android:2c2ae4be45eb3031947c29",
      messagingSenderId: "XXX", // change
      projectId: "expiry-reminder-3e68c",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: HomeScreen(),
        );
      });
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).iconTheme.color,
        onPressed: () {},
      ),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              "hiiiii $text",
              style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("data"))
        ],
      ),
    );
  }
}
