import 'package:flutter/material.dart';
import 'package:flutter_retrofit_trial/network/api_service.dart';
import 'package:flutter_retrofit_trial/network/modal/InvestTips_Response.dart';
import 'package:provider/provider.dart';
class trading extends StatefulWidget {
  const trading({Key key}) : super(key: key);

  @override
  _tradingState createState() => _tradingState();
}

class _tradingState extends State<trading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data',
      home: DefaultTabController(
        length: 4,
        child:  Scaffold(appBar: PreferredSize(
          preferredSize:  Size.fromHeight(100.0),
          child: AppBar(
            title: Text('data'),
            leading: getappbarstyle(),
            bottom: PreferredSize(
              preferredSize:  Size.fromHeight(50.0),

              child:Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: TabBar(
                  tabs: [
                    Tab(
                      text: 'my tips',
                    ),
                    Tab(
                      text: 'new tips',
                    ),Tab(
                      text: 'Expired tips',
                    ),
                    Tab(
                      text: 'Watch list',
                    ),
                  ],
                ),

            )
          ),

        ),
        ),
          body:

              TabBarView(children: [
                getapiforinvesttips(context),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_bike)
              ])
        ),
      ),
    );
  }

 Widget getapiforinvesttips(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(140.0),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
              decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  hintText: 'Search by advisor name',
                  prefixIcon: Icon(
                      Icons.search
                  )

              )
          ),
        ),
      ),
      body: _mytipsapi(context),
    );
 }

 Widget getappbarstyle() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                // Text('data',
                //   style: TextStyle(
                //     fontSize: 18.0,
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 298.0,right: 10.0),
                  child: ElevatedButton(onPressed: (){},
                    child: Text(
                        'Equity Cash'
                    ),

                  ),
                ),
                Icon(Icons.keyboard_arrow_down_sharp)
              ],
            ),

          ],
        ),
      )
    );
 }
}

FutureBuilder _mytipsapi(BuildContext context) {
  return  FutureBuilder<InvestTips_Response>(
    future:
    // client.loginUser(phone, password),

    Provider.of<ApiService>(context, listen: false)
        .invettips('Bearer S8scMvO7QNJvKDFHmQs2MgpqzTrnRirPMwnyob6dLh774Cx5zjRUDEXLwFxk'),


    builder: (context, snapshot) {
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
        // Fluttertoast.showToast(
        //     msg: tasks.message,
        //     toastLength: Toast.LENGTH_SHORT,
        //     fontSize: 36.0);

        // error = tasks.message;
        print("object" + tasks.message);

        return getviewoftips(tasks);
        // snapshot.data;

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

Widget getviewoftips(InvestTips_Response tasks) {
  return   ListView.builder(
    itemCount: tasks.data.length,
      itemBuilder: (BuildContext context, int position){
        return gettipsitem(position,tasks);
      }
  );
}

Widget gettipsitem(int position, InvestTips_Response tasks) {
  print('tipsdata'+tasks.data.toString());
  return GestureDetector(
    child: Center(
      child: Text(
          tasks.data.elementAt(position).stock


      ),
    ),
  );

}

