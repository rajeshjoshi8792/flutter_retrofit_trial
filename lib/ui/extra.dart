import 'package:flutter/material.dart';
import 'package:flutter_retrofit_trial/network/api_service.dart';
import 'package:flutter_retrofit_trial/network/modal/LoginResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class extra extends StatefulWidget {
  final int phone;
  final String password;
  extra( this.phone, this.password);

  
  @override
  _extraState createState() => _extraState();
}

class _extraState extends State<extra> {
  @override
  Widget build(BuildContext context) {
    int phone1 = widget.phone;
    String password1 = widget.password;

    return Scaffold(
      appBar: AppBar(
        title: Text("API TEST"),
      ),
      body: _listFutureTasks(context,phone1,password1),

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
            .loginUser(phone, password),


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

            // error = tasks.message;
            print("object" + tasks.message);

            return
              // snapshot.data;

              Center(
                child: Text(snapshot.data.message),
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
