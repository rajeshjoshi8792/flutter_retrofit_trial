import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_retrofit_trial/network/api_service.dart';
import 'package:flutter_retrofit_trial/network/modal/LoginResponse.dart';
import 'package:flutter_retrofit_trial/network/modal/RegisterResponse.dart';
import 'package:flutter_retrofit_trial/ui/dashboard.dart';
import 'package:flutter_retrofit_trial/ui/extra.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
class login extends StatefulWidget {


  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
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
  var error = "message";
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Now'),
        elevation: 1.0,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(17.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text('Login'),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
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

                    inputFormatters: <TextInputFormatter>[
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
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: ElevatedButton(

                    onPressed: () async {
                      final api = Provider.of<ApiService>(context, listen: false);
                      api.loginUser( phone, password).then((it) {
                        print("gvvd"+ it.message.toString());
                      setState(() {
                        this.error = it.message.toString();
                      });
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard_main()));

                        }

                      }).catchError((onError){
                        print('porivuder'+ onError.toString());
                      });
                    },
                    // {
                    //
                    //   // Navigator.push(context, MaterialPageRoute(builder: (context) => extra(phone,password)));
                    //
                    // },
                        // _listFutureTasks(context, phone, password ),

                    child: const Text('login'),
                  ),
                ),

                Text("$error") ,
              ]),
        ),
      ),
    );
  }

  FutureBuilder _listFutureTasks(BuildContext context, int phone,
      String password)   {
    if (phone <= 0) {
      Fluttertoast.showToast(msg: "please write number",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 26.0);
    } else if (password.length <= 0) {
      Fluttertoast.showToast(msg: "please write password",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 16.0);
    } else {
      // final client = ApiService(
      //     Dio(BaseOptions(contentType: "application/json")));
      //     return  FutureBuilder<LoginResponse>(
      //       future:   Provider.of<ApiService>(context, listen: false)
      //           .loginUser(phone, password),
      //
      //
      //       // async work
      //       builder: (context, snapshot) {
      //         print("object");
      //
      //         switch (snapshot.connectionState) {
      //
      //         case ConnectionState.waiting: return Text('Loading....');
      //
      //           default:
      //             if (snapshot.hasError)
      //               return Text('Error: ${snapshot.error}');
      //             else
      //               return Text('success: ${snapshot.data}');
      //
      //
      //         }
      //       },
      //     );

      return FutureBuilder<LoginResponse>(
        future:
        // client.loginUser(phone, password),

        Provider.of<ApiService>(context, listen: false)
            .loginUser(9682, "125"),


        builder: (context, snapshot)  {
          print("object");
          if (snapshot.connectionState == ConnectionState.done) {
            print("object2");

            if (snapshot.hasError) {
              print("object1cc1");

              return
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                      "Something wrond"),

              );
            }
            final tasks = snapshot.data;
            Fluttertoast.showToast(
                msg: tasks.message,
                toastLength: Toast.LENGTH_SHORT,
                fontSize: 36.0);

            error = tasks.message;
            print("object" + tasks.message);

            return
              // snapshot.data;

            Center(
              child: Text('$error'),
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },

      );
    }
  }
}
