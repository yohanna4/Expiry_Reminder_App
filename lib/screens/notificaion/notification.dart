import 'package:expiry_reminder/screens/login/login.dart';
import 'package:expiry_reminder/screens/notificaion/notification_detail.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 230, 230),
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
            "Notifications",
            // style: TextStyle(fontFamily: fontf),
          ),
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: SingleChildScrollView(
          child: buildNotif(),
        ));
  }

  late final String title, subtitle;
  Widget buildNotifTile(
      {required String title,
      required String subtitle,
      required Future Function() onTap,
      required bool enable}) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
      ),
      title: Text(title,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
      subtitle: Text(subtitle,
          style: TextStyle(color: Color.fromARGB(136, 31, 31, 31))),
      onTap: onTap,
      enabled: enable,
    );
  }

  Widget buildNotiff() {
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 12,
        itemBuilder: (context, index) {
          return buildNotifTile(
            title: 'Your-Mechanic',
            subtitle: 'Thanks for download Your-Mechanic app.',
            enable: true,
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen())),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            // margin: EdgeInsets.symmetric(horizontal: 5),
            height: 0.4,
            color: const Color.fromARGB(255, 216, 215, 215),
          );
        });
  }

  Widget buildNotif() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              child: ListView.builder(
                  // padding: EdgeInsets.only(),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationDetailScreen()));
                            },
                            child: Container(
                              // margin: EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              height: 100,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 17, 20, 9),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "2022-07-14",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 11, 11, 11),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "lorem ipsumnnnnnnnnnnnnnnnnnnnnnnnnnn nnnnnnnnnnnnnnnnnnnn nnnn",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 51, 51, 51),
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ]);
                  }),
            )),
      ],
    );
  }
}
