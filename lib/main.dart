import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        title: "Form Pendaftaran",
        home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  RegExp numvalid = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
  RegExp mailvalid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  TextEditingController name = TextEditingController();

  get number => TextEditingController();
  List areas = ['201', '202', '203' , '204' , '205'];
  String area;

  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();

  List states = ['papua', 'jawa', 'sumatra', 'bali', 'aceh'];
  String state;
  TextEditingController zip = TextEditingController();

  TextEditingController mail = TextEditingController();
  TextEditingController birthday = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Pendaftaran"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    // Text("data"),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Name"
                          ),
                          controller: name,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Masukkan Nama';
                            }
                            return null;
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.call),
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Number"
                          ),
                          controller: number,
                          validator: (String value){
                            if(value.isEmpty || value == null){
                              return 'Masukkan Angka';
                            } else if(!(numvalid.hasMatch(value))) {
                              return 'Harus Angka';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 20, top: 16),
                        child: DropdownButton(
                          hint: Text("Area"),
                            value: area,
                            items: areas.map((value) {
                              return DropdownMenuItem(
                                  child: Text(value),
                                  value: value
                              );
                            }).toList(),
                            onChanged: (value) {
                            setState(() {
                              area = value;
                            });
                            }
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                //address
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on),
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Address"
                          ),
                          controller: address,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                //city
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 43),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "City"
                          ),
                          controller: city,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                  ],
                ),
                //state and zip
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 43, top: 20),
                        child: DropdownButton(
                            hint: Text("State"),
                            value: state,
                            items: states.map((value) {
                              return DropdownMenuItem(
                                  child: Text(value),
                                  value: value
                              );
                            }).toList(),
                            onChanged: (value){
                              setState(() {
                                state = value;
                              });
                            })
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Zip"
                          ),
                          controller: zip,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: <Widget>[
                    Icon(Icons.mail),
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Email"
                          ),
                          controller: mail,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Masukkan Email';
                            } else if(!(mailvalid.hasMatch(value))){
                              return 'Masukkan Email dengan Benar!';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Icon(Icons.cake),
                    Expanded(
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Birthday",
                              suffixIcon: Icon(Icons.date_range)
                          ),
                          controller: birthday,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  child: Text(
                    "Kirim",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
                    return false;
                  },
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}


// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final appTitle = 'Form Validation Demo';
//
//     return MaterialApp(
//       title: appTitle,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(appTitle),
//         ),
//         body: MyCustomForm(),
//       ),
//     );
//   }
// }
//
// // Create a Form widget.
// class MyCustomForm extends StatefulWidget {
//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }
//
// // Create a corresponding State class.
// // This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           TextFormField(
//             validator: (value) {
//               if (value.isEmpty) {
//                 return 'Please enter some text';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 16.0),
//             child: RaisedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, or false
//                 // otherwise.
//                 if (_formKey.currentState.validate()) {
//                   // If the form is valid, display a Snackbar.
//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




