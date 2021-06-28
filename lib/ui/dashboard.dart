
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter_retrofit_trial/ui/extra.dart';
import 'package:flutter_retrofit_trial/ui/register.dart';
import 'package:flutter_retrofit_trial/ui/trading.dart';
import 'package:flutter_retrofit_trial/ui/trading_ff.dart';

class dashboard_main extends StatelessWidget {
  const dashboard_main({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   primarySwatch: Colors.green
      // ),
      home: _dashboarddata(),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
class _dashboarddata extends StatefulWidget {
  const _dashboarddata({Key key}) : super(key: key);

  @override
  __dashboarddataState createState() => __dashboarddataState();
}

class __dashboarddataState extends State<_dashboarddata> {
  @override
  void initState() {
    super.initState();
  }
  int _selectedIndex = 0 ;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[

    // Navigator.push(context, MaterialPageRoute(builder: trading())),
    Text(
      'Index 1: Investment',
      style: optionStyle,
    ),
    Text(
      'Index 2: Portfolio',
      style: optionStyle,
    ), Text(
      'Index 3: Advisor',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
         items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex==0 ? new Icon(Icons.trending_up,
              color: Colors.blue,
            ): new Icon(Icons.trending_up,
              color: Colors.black,
            ),
            label: 'Tradinng',
              backgroundColor:  _selectedIndex==0 ? Colors.black12: Colors.black12


          ),
          BottomNavigationBarItem(
            icon: _selectedIndex==1 ? new Icon(Icons.home,
              color: Colors.blue,
            ): new Icon(Icons.home,
              color: Colors.black,
            ),
            label: 'Investment',
            backgroundColor:  _selectedIndex==1 ? Colors.red: Colors.yellow
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex==2 ? new Icon(Icons.book,
              color: Colors.blue,
            ): new Icon(Icons.book,
              color: Colors.black,
            ),

            label: 'Portfolio',
              backgroundColor:  _selectedIndex==2? Colors.yellow: Colors.black

          ), BottomNavigationBarItem(
             icon: _selectedIndex==3 ? new Icon(Icons.engineering_sharp,
               color: Colors.blue,
             ): new Icon(Icons.engineering_sharp,
               color: Colors.black,
             ),
             label: 'Advisor',
               backgroundColor:  _selectedIndex==3 ? Colors.black: Colors.black
           ),
        ],
          currentIndex: _selectedIndex,

          selectedItemColor: Colors.blue[800],
          onTap: _onItemTapped,
        showUnselectedLabels: true,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _children,
      )
      //   Center(
      //   child:  _selectedIndex == 0?trading_ff(): Navigator.push(context, MaterialPageRoute(builder: (context) => trading()))
      //   // _widgetOptions.elementAt(_selectedIndex),
      // ),
    );
  }

}

final List<Widget> _children = [
  trading_ff(),
  extra(123456, "1234"),
  trading(),
  register()
];



