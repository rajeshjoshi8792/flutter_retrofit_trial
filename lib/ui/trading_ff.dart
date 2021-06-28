import 'package:flutter/material.dart';
import 'package:flutter_retrofit_trial/network/api_service.dart';
import 'package:flutter_retrofit_trial/network/modal/InvestTips_Response.dart';
import 'package:provider/provider.dart';
import 'package:top_sheet/top_sheet.dart';

class trading_ff extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     primarySwatch: Colors.green
      // ),
      home: _mytips(),
    );




  }
}
class _mytips extends StatefulWidget {
  const _mytips({Key key}) : super(key: key);

  @override
  __mytipsState createState() => __mytipsState();
}

class __mytipsState extends State<_mytips> {
  var selectedtab;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child:  Scaffold(
            appBar: PreferredSize(
              preferredSize:  Size.fromHeight(200.0),
              child: AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 18.0,top: 18.0),
                  child: Text('Trading'),
                ),
                actions: <Widget>[
                  getappbarstyle()
                ],
                bottom: PreferredSize(
                    preferredSize:  Size.fromHeight(10.0),

                    child:Stack(
                      overflow: Overflow.visible,
                      alignment: Alignment.bottomCenter,

                      children: [
                        Positioned(top:120.0,left: 10.0,right: 10.0, child:  TextField(
                            decoration:InputDecoration(
                                fillColor: Colors.white,
                                border: OutlineInputBorder(),
                                filled: true,
                                hintText: 'Search by advisor name',
                                prefixIcon: Icon(
                                    Icons.search
                                )

                            )
                        ),
                        ),
                        Positioned(child:
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0,bottom: 80.0),
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

                        ),
                        ),

                      ],

                    )
                ),

              ),
            ),

            body: getviewoftips(context)
        ),


      ),
    );
  }

  Widget getappbarstyle() {
    return PreferredSize(
        child:  Padding(
            padding: const EdgeInsets.only(left: 0.0,top: 18.0),
            child: Container(
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Text('data',
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0,right: 30.0),
                    child: ElevatedButton(onPressed: (){TopSheet.show(
                      context: context,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.music_note),
                            title: Text('Music'),
                          ),
                          ListTile(
                            leading: Icon(Icons.photo_album),
                            title: Text('Photos'),
                          ),
                          ListTile(
                            leading: Icon(Icons.videocam),
                            title: Text('Video'),
                          ),
                        ],
                      ),
                      direction: TopSheetDirection.TOP,
                    );},
                      child: Text(
                          'Equity Cash'
                      ),

                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down_sharp,
                    ),
                    iconSize: 30,
                    color: Colors.white,
                    splashColor: Colors.purple,
                    onPressed: () {
                      TopSheet.show(
                        context: context,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.music_note),
                              title: Text('Music'),
                            ),
                            ListTile(
                              leading: Icon(Icons.photo_album),
                              title: Text('Photos'),
                            ),
                            ListTile(
                              leading: Icon(Icons.videocam),
                              title: Text('Video'),
                            ),
                          ],
                        ),
                        direction: TopSheetDirection.TOP,
                      );

                    },
                  )
                ],
              ),
            )

        ),
        preferredSize: Size.fromHeight(50.0));


  }


}
Widget getviewoftips(BuildContext context) {
  return Stack(
    children: [
      Positioned(child:TabBarView(children: [
        getfirstview(context),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
        Icon(Icons.directions_bike)
      ])
      )
    ],
  ) ;



}
Widget getfirstview(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 38.0),
    child: Scaffold(
        body: _mytipsapi(context)

    ),
  );


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

        return Scaffold(
          backgroundColor: Colors.transparent,
          body:ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int position){
                return gettipsitem(position,snapshot,context);
              }
          ) ,
        ) ;
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
Widget gettipsitem(int position, AsyncSnapshot<InvestTips_Response> snapshot, BuildContext context) {

  return GestureDetector(
    onTap: () {
      showBottomSheet(context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(Icons.photo),
                title: new Text(snapshot.data.data.elementAt(position).stock),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text(snapshot.data.data.elementAt(position).createdAt),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.videocam),
                title: new Text(snapshot.data.data.elementAt(position).riskType),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: new Icon(Icons.share),
                title: new Text(snapshot.data.data.elementAt(position).stopLoss),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );

        },
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: PreferredSize(
        preferredSize: Size.fromHeight(280.0),
        child: Card(
            margin:EdgeInsets.symmetric(horizontal: 14.0),
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18.0,top: 18.0,bottom: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                          snapshot.data.data.elementAt(position).stock
                      ),
                      Text(
                          snapshot.data.data.elementAt(position).entryPoint
                      ),
                      Text(
                          snapshot.data.data.elementAt(position).createdAt
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: <Widget>[
                      Text(
                          snapshot.data.data.elementAt(position).stock
                      ),
                      Text(
                          snapshot.data.data.elementAt(position).entryPoint
                      ),
                      Text(
                          snapshot.data.data.elementAt(position).createdAt
                      ),

                    ],
                  ),
                )




              ],
            )

        ),
      ),
    ),
  );

}

