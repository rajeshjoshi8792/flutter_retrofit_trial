import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_retrofit_trial/network/api_service.dart';
import 'package:flutter_retrofit_trial/network/modal/RegisterResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class register extends StatelessWidget {
  // const register({Key key}) : super(key: key);
  //
  // @override
  // _registerState createState() => _registerState();

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
  GlobalKey<FormFieldState<String>>();
  String name = "";
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  int phone = 0;
  String password = "";
  String email = "";
  String message = "";
  String error = "message";
  Map<String, dynamic> _data;


  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    bool pressed = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Register Now'),
        elevation: 1.0,
      ),
      body: Container(
        child: Container(
          padding: const EdgeInsets.all(17.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text('register'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.name,

                    inputFormatters:  <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(12),
                      FilteringTextInputFormatter.singleLineFormatter,],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.person),
                      hintText: 'What do people call you?',
                      labelText: 'Name *',
                    ),
                    onChanged: (value) {
                      if (value.isEmpty) {
                        name = "";
                      }
                      print("name" + value);
                      name = value;
                    },
                    validator: _validateName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters:  <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.singleLineFormatter],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.phone),
                      hintText: 'Where can we reach you?',
                      labelText: 'Phone Number *',
                      prefixText: '+91',),
                    onChanged: (value) {
                      print("phone" + value);
                      phone = int.parse(value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: _passwordFieldKey,
                    keyboardType: TextInputType.visiblePassword,

                    inputFormatters:  <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.singleLineFormatter],
                    obscureText: true,
                    decoration: InputDecoration(
                        helperText: 'No more than 8 characters.',
                        labelText: 'Password *',
                        filled: true,
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: 'Enter a password'),
                    onChanged: (value) {
                      print("pass" + value);
                      password = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters:  <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(20),
                      FilteringTextInputFormatter.singleLineFormatter],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.email),
                      hintText: 'Your email address',
                      labelText: 'E-mail',),
                    onChanged: (value) {
                      print("email" + value);
                      email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      final api = await Provider.of<ApiService>(context, listen: false);
                      pressed = true;
                      api.createUser(name, phone, password, email, "address").then((it) {

                        print("gvvd"+ it.message.toString());
                        this.error = it.message.toString();
                        if(it.message.toString()=="null"){
                          Fluttertoast.showToast(msg: 'Please Complete Process',
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        else{
                          Fluttertoast.showToast(msg: 'Welcome ' + it.message.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }


                        // print("gvvd"+ it.toJson()['data']);
                      }).catchError((onError){
                        print('porivuder'+ onError.toString());
                      });
                    },
                    //     () async {
                    //
                    //    _listFutureTasks(context, name, phone, password, email);
                    //   // then((result) {
                    //
                    //
                    //
                    //
                    //
                    //
                    // },

                    child:

                    const Text('Register'),
                  ),
                ),
                 pressed ?
                 Text("$error"):Text('errorbody'),

                // Text("$error"),
              ]),
        ),
      ),
    );
}

// class _registerState extends State<register> {
//
//
//   }
  // void dataget(){
  //   setState(() {
  //     this.error = '<none>';
  //   });
  Future _listFutureTasks(BuildContext context, String name, int phone,
      String password, String email) async {
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);

    if(name.length <= 0){
      Fluttertoast.showToast(msg: "please write name",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    } else if(phone <= 0){
      Fluttertoast.showToast(msg: "please write number",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 26.0);
    } else if(password.length <= 0){
      Fluttertoast.showToast(msg: "please write password",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    } else if(!emailValid){
      Fluttertoast.showToast(msg: "please write email",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    } else{
      // final client = ApiService(Dio(BaseOptions(contentType: "application/json")));
    FutureBuilder<RegisterResponse>(
        future:   Provider.of<ApiService>(context, listen: false)
            .createUser(name, phone, password, email, "avva"),

      // async work
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return Text('Loading....');
            default:
              if (snapshot.hasError)
                return Container(
                  alignment: Alignment.bottomCenter,
                    child: Text(
                    'Error: ${snapshot.error}'));
              else
                return Container(
                    alignment: Alignment.bottomCenter,
                    child:
                    Text('Result: ${snapshot.data}')
                );
          }
        },
      );

    // return  FutureBuilder<RegisterResponse> (
    //        future:
    //        // client.createUser(name, phone, password, email, address)
    //
    //       Provider.of<ApiService>(context, listen: false)
    //         .createUser(name, phone, password, email, "avva"),
    //     builder: (BuildContext context, AsyncSnapshot<RegisterResponse> snapshot) {
    //       print("object");
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         print("object");
    //
    //         if (snapshot.hasError) {
    //           print("object1cc1");
    //
    //           return Container(
    //             child: Center(
    //               child: Text("Something wrond"),
    //             ),
    //           );
    //         }
    //         final tasks = snapshot.data;
    //         Fluttertoast.showToast(
    //             msg: tasks.message,
    //             toastLength: Toast.LENGTH_SHORT,
    //             fontSize: 36.0);
    //
    //         error= tasks.message;
    //         print("object"+ tasks.message);
    //
    //          return Center(
    //            child: Text('$error'),
    //          );
    //
    //
    //
    //
    //
    //       } else {
    //         return Container(
    //           child: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       }
    //     },
    //
    //   );
    }

  }
  }



// }





