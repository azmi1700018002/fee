import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/login.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/network/api.dart';
class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String name = '';
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user'));
    if (user != null) {
      setState(() {
        name = user['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Setting'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.abc),
              title: Text('Replace Name'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.password),
              title: Text('Replace Password'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onPressed: (Logout) {
                showAlertDialog(context);
                // Navigator.pop(context);
                //Navigator.popUntil(context, ModalRoute.withName('/'));
                // Navigator.pop(context,true);
                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
              },
            ),
          ],
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Kembali"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Log Out"),
      onPressed: () {
        logout();
        // Navigator.pushAndRemoveUntil(
        //     context, MaterialPageRoute(builder: (context) => Login()), (
        //     Route<dynamic> route) => false);
        // Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Perhatian"),
      content: Text(
          "Pastikan semua aktivitas sudah selesai, ya. Terimakasih telah mengakses Kredit Mikro."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void logout() async {
    var res = await Network().getData('logout');
    var body = json.decode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('token');
      localStorage.remove('user');
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Login()),
          (Route<dynamic> route) => false);
    }
  }
}
