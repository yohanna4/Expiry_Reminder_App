import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatefulWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  State<NotificationDetailScreen> createState() =>
      _NotificationDetailScreenState();
}

class _NotificationDetailScreenState extends State<NotificationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
          ),
          title: const Text(
            "Notification Detail",
            // style: TextStyle(fontFamily: fontf),
          ),
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 17, 20, 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "2022-07-14",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 11, 11, 11),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "lorem ipsumnnnnnnnnnnnnnnnnnnnnnnnnnn nnnnnnnnnnnnnnnnnnnn nnnn",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 51, 51, 51),
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "lorem ipsumnnnnnnnnnnnnnnnnnnnnnnnnnn nnnnnnnnnnnnnnnnnnnn nnnn",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 51, 51, 51),
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
        ));
  }
}
