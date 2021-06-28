import 'package:flutter_retrofit_trial/network/api_service.dart';
import 'package:flutter_retrofit_trial/network/modal/RegisterResponse.dart';
import 'package:flutter_retrofit_trial/network/modal/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_retrofit_trial/ui/dashboard.dart';
import 'package:flutter_retrofit_trial/ui/login.dart';
import 'package:flutter_retrofit_trial/ui/register.dart';
import 'package:provider/provider.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API TEST"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              heroTag: Text("btn1"),

              onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => register()));

      },

        // async {
        //   final api = Provider.of<ApiService>(context, listen: false);
        //   api.createUser("name", "41111114", "123", "ema2l@gmail.com","aaa").then((it) {
        //     it.forEach((f) {
        //       print(f.message);
        //     });
        //   }).catchError((onError){
        //     print(onError.toString());
        //   });
        // },
        child: Icon(Icons.terrain),
      ),
             Text("Register"),
             SizedBox(height: 50.0),
             FloatingActionButton(
               heroTag: Text("btn2"),

               onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => dashboard_main()));

              },

              // async {
              //   final api = Provider.of<ApiService>(context, listen: false);
              //   api.createUser("name", "41111114", "123", "ema2l@gmail.com","aaa").then((it) {
              //     it.forEach((f) {
              //       print(f.message);
              //     });
              //   }).catchError((onError){
              //     print(onError.toString());
              //   });
              // },
              child: Icon(Icons.safety_divider),
            ),
            Text("Login"),
            SizedBox(height: 50.0),
          ],
        ),
      ),
      // _listFutureTasks(context),


    );
  }

  FutureBuilder _listFutureTasks(BuildContext context) {
    return FutureBuilder<RegisterResponse>(
      future: Provider.of<ApiService>(context, listen: false).createUser("nme1", 33, "113", "f43l@gmail.com","avva"),
      builder: (BuildContext context, AsyncSnapshot<RegisterResponse> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("Something wrond"),
              ),
            );
          }
          final tasks = snapshot.data;
          return _listTasks(context: context, tasks: tasks);

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

  ListView _listTasks({BuildContext context, RegisterResponse tasks}) {
    return ListView.builder(
      itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Text(tasks.data.name),
                title: Text(tasks.data.email),
              ),
            ),
          );
        });
  }
}

