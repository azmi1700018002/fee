import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/BottomBar/BottomBarMenu/chek.dart';
import 'package:flutter_auth/screens/BottomBar/BottomBarMenu/hasilnot.dart';
import 'package:flutter_auth/screens/BottomBar/BottomBarMenu/notification.dart';
import 'package:flutter_auth/screens/BottomBar/BottomBarMenu/setting.dart';
import 'package:flutter_auth/screens/dashboard.dart';


class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentTab = 1;

  final List<Widget> screen = [
    Dashboard(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset("assets/images/logo.png"),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Dashboard();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab == 1 ? Colors.blue.shade900 : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color:
                                  currentTab == 1 ? Colors.blue.shade900 : Colors.grey,
                            ),
                          )
                        ],
                      )),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = HasilNot();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.recent_actors,
                            color: currentTab == 2 ? Colors.blue.shade900 : Colors.grey,
                          ),
                          Text(
                            'Riwayat',
                            style: TextStyle(
                              color:
                                  currentTab == 2 ? Colors.blue.shade900 : Colors.grey,
                            ),
                          )
                        ],
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = MyApp();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.message,
                            color: currentTab == 3 ? Colors.blue.shade900 : Colors.grey,
                          ),
                          Text(
                            'Notice',
                            style: TextStyle(
                              color:
                                  currentTab == 3 ? Colors.blue.shade900 : Colors.grey,
                            ),
                          )
                        ],
                      )),
                  MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = Setting();
                          currentTab = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: currentTab == 4 ? Colors.blue.shade900 : Colors.grey,
                          ),
                          Text(
                            'Setting',
                            style: TextStyle(
                              color:
                                  currentTab == 4 ? Colors.blue.shade900 : Colors.grey,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  }

