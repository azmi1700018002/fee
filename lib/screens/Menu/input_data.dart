import 'package:cool_stepper/cool_stepper.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/Menu/manual.dart';
import 'package:select_form_field/select_form_field.dart';

void main() {
  runApp(InputData());
}

class InputData extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Stepper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: InputNasabah(title: 'RISK RATING KREDIT MIKRO'),
    );
  }
}

class InputNasabah extends StatefulWidget {
  InputNasabah({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InputNasabahState createState() => _InputNasabahState();
}

class _InputNasabahState extends State<InputNasabah> {
  DateTime selectedDate;
  final _formKey = GlobalKey<FormState>();
  String selectedRole = 'Writer';
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final List<Map<String, dynamic>> _pd = [
    {
      'value': 'boxValue',
      'label': 'SD',
    },
    {
      'value': 'circleValue',
      'label': 'SMP',
    },
  ];
  final List<Map<String, dynamic>> _ju = [
    {
      'value': 'boxValue',
      'label': 'Pedagang',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final steps = [
      //Analisa Debitur
      CoolStep(
        title: 'Data & Analisa Debitur',
        subtitle: 'Isi Form Analisa Debitur',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                labelText: 'Peminjam 1',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Peminjam 1 Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              RaisedButton(
                child: Text("Detail"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text('Data Nasabah'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'File1.pdf',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'File2.pdf',
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
              _buildTextField(
                labelText: 'Alamat 1',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Alamat 1 Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Lamanya berusaha (tahun)',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Lamanya berusaha (tahun) Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Tempat Lahir',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Tempat Lahir Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              DateTimePicker(
                initialValue: '',
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                dateLabelText: 'Tanggal Lahir',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Pendidikan',
                items: _pd,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Jenius Usaha',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              _buildTextField(
                labelText: 'SKPK No',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'SKPK No Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              DateTimePicker(
                initialValue: '',
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                dateLabelText: 'Tanggal ',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              new TextField(
                maxLines: 3,
                decoration: new InputDecoration(
                  hintText: "Deskripsi pemohon :",
                  labelText: "Deskripsi pemohon :",
                ),
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),

      // Analisa Kredit Mikro
      CoolStep(
        title: 'Data & Analisa Kredit Mikro',
        subtitle: 'Isi Form Kredit Mikro',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                labelText: 'Kredit yang diusulkan',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Kredit yang diusulkan Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Provisi (%)',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Provisi (%) Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Digunakan untuk',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digunakan untuk Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Pinjaman lainnya',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Pinjaman lainnya Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Nilai Asset',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nilai Asset Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Penjualan/bln yll',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Penjualan/bln yll Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'HPP dan bagi hasil/bln',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'HPP dan bagi hasil/bln Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Biaya Tenaga Kerja',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Biaya Tenaga Kerja Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Biaya Kebersihan',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Biaya Kebersihan Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Biaya Hidup',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Biaya Hidup Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Bunga/thn (%)',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Bunga/thn (%) Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              new TextField(
                maxLines: 3,
                decoration: new InputDecoration(
                  hintText: "Deskripsi pemohon :",
                  labelText: "Deskripsi pemohon :",
                ),
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),

      //Analisa Agunan
      CoolStep(
        title: 'Data & Analisa Agunan',
        subtitle: 'Isi Form Analisa Agunan',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                labelText: 'Barang Agunan',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Barang Agunan Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Asuransi',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Asuransi Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Nilai Agunan',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nilai Agunan Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Bukti Kepemilikan Agunan',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Bukti Kepemilikan Agunan Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              _buildTextField(
                labelText: 'Ijin yang dimiliki',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Ijin yang dimiliki Harus Di Isi';
                  }
                  return null;
                },
                controller: _nameCtrl,
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              new TextField(
                maxLines: 3,
                decoration: new InputDecoration(
                  hintText: "Deskripsi pemohon :",
                  labelText: "Deskripsi pemohon :",
                ),
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),

      //Analisa Karakter
      CoolStep(
        title: 'Data & Analisa Karakter',
        subtitle: 'Isi Form Analisa Karakter',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Ulet Dalam Bisnis',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Flexible',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Kreatif/Inovatif',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Memiliki Kejujuran dlm bisnis',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              new TextField(
                maxLines: 3,
                decoration: new InputDecoration(
                  hintText: "Deskripsi pemohon :",
                  labelText: "Deskripsi pemohon :",
                ),
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),

      //Analisa Bisnis
      CoolStep(
        title: 'Data & Analisa Bisnis',
        subtitle: 'Isi Form Analisa Bisnis',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Omzet Penjualan',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Harga bersaing',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Persaingan',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Lokasi',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Produktivitas thp kapasitas terpasan',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              SelectFormField(
                type: SelectFormFieldType.dropdown, // or can be dialog
                labelText: 'Kwalitas',
                items: _ju,
                onChanged: (val) => print(val),
                onSaved: (val) => print(val),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              new TextField(
                maxLines: 3,
                decoration: new InputDecoration(
                  hintText: "Deskripsi pemohon :",
                  labelText: "Deskripsi pemohon :",
                ),
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKey.currentState.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
    ];
    final stepper = CoolStepper(
      showErrorSnackbar: false,
      onCompleted: () {
        print('Steps completed!');
      },
      steps: steps,
      config: CoolStepperConfig(
        backText: 'PREV',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: stepper,
      ),
    );
  }

  Widget _buildTextField({
    String labelText,
    FormFieldValidator<String> validator,
    TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
        controller: controller,
      ),
    );
  }

  Widget _buildSelector({
    BuildContext context,
    String name,
  }) {
    final isActive = name == selectedRole;

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : null,
          border: Border.all(
            width: 0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: RadioListTile(
          value: name,
          activeColor: Colors.white,
          groupValue: selectedRole,
          onChanged: (String v) {
            setState(() {
              selectedRole = v;
            });
          },
          title: Text(
            name,
            style: TextStyle(
              color: isActive ? Colors.white : null,
            ),
          ),
        ),
      ),
    );
  }
}
