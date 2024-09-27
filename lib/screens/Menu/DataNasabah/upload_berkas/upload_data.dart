import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  UploadPage({Key key}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  Future<String> uploadImage(filename, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', filename));
    var res = await request.send();
    return res.statusCode.toString();
  }

  String state = "";
  String url = "";

  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Upload Berkas Debitur"),
        ),
        body: Container(
            alignment: Alignment.topCenter,
        child : SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(children: [
                  DataTable(

                    columns: <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Data',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Action',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Expanded(
                              child: Text(
                            'KTP',
                            textAlign: TextAlign.center,
                          ))),
                          DataCell(
                            RaisedButton.icon(
                              onPressed: () async {
                              var file = await ImagePicker.pickImage(source: ImageSource.gallery);
                              var res = await uploadImage(file.path, url);
                              setState(() {
                                state = res;
                                print(res);
                              });

                                print('Button Clicked.');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              label: Text(
                                'Upload File',
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.cloud_upload,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              splashColor: Colors.red,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Expanded(
                              child: Text(
                            'Buku Rekening',
                            textAlign: TextAlign.center,
                          ))),
                          DataCell(
                            RaisedButton.icon(
                              onPressed: () {
                                print('Button Clicked.');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              label: Text(
                                'Upload File',
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.cloud_upload,
                                color: Colors.white,
                              ),
                              textColor: Colors.white,
                              splashColor: Colors.red,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                    // floatingActionButton: FloatingActionButton(
                    //   onPressed: () async {
                    //     var file = await ImagePicker.pickImage(source: ImageSource.gallery);
                    //     var res = await uploadImage(file.path, url);
                    //     setState(() {
                    //       state = res;
                    //       print(res);
                    //     });
                    //   },
                    //   child: Icon(Icons.add),
                    // ),
                  )
                ])))));
  }
}
