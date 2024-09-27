import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/BottomBar/Master.dart';
import 'package:flutter_auth/screens/Menu/DataNasabah/pengajuan_kredit/t_pil_penghasilan.dart';
import 'screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            // color: const Color(0xFF151026),
            backgroundColor: Colors.black,
            elevation: 0,
          )),
      home: CheckAuth(),
      routes: {
        '/menu_penghasilan': (context) => T_Penghasilan(),
      },
      // darkTheme: ThemeData(brightness: Brightness.dark, accentColor: Colors.blueAccent),
      // themeMode: ThemeMode.dark,
    );
  }
}
class CheckAuth extends StatefulWidget{
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth>{
  bool isAuth = false;

  @override
  void initState(){
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      if(mounted){
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context){
    Widget child;
    if(isAuth){
      child = BottomBar();
    } else{
      child = Login();
    }

    return Scaffold(
      body: child,
    );
  }
}