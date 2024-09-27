import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/BottomBar/BottomBarMenu/cob2.dart';
import 'package:flutter_auth/screens/BottomBar/BottomBarMenu/screen2not.dart';

class HasilNot extends StatefulWidget {
  const HasilNot({Key key}) : super(key: key);

  @override
  State<HasilNot> createState() => _HasilNotState();
}

class _HasilNotState extends State<HasilNot> {
  LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Notification'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Belajar Notif'
                        // style: TextStyle(fontSize: 20),
                        ),
                    ElevatedButton(
                        onPressed: () async {
                          await service.showNotification(
                              id: 0,
                              title: 'Notification Title',
                              body: 'Some body');
                        },
                        child: const Text('Show Schedule Notification')),
                    ElevatedButton(
                        onPressed: () async {
                          await service.showScheduleNotification(
                            id: 0,
                            title: 'Notification Title',
                            body: 'Some body',
                            seconds: 4,
                          );
                        },
                        child: const Text('Show Local Notification')),
                    ElevatedButton(
                        onPressed: () async {
                          await service.showNotificationWithPayload(
                            id: 0,
                            title: 'Notification Title',
                            body: 'Some body',
                            payload: 'Halaman Notification',
                          );
                        },
                        child: const Text('Show Local Notification')),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Scren2(payload: payload)),
      );
    }
  }
}
