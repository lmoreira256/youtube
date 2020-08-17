import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/screens/Biblioteca.dart';
import 'package:youtube/screens/EmAlta.dart';
import 'package:youtube/screens/Inicio.dart';
import 'package:youtube/screens/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndexNavigationBar = 0;
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Inicio(_searchText),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset(
          'images/youtube.png',
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          //IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                String res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());

                setState(() {
                  _searchText = res;
                });
              }),
          //IconButton(icon: Icon(Icons.account_circle), onPressed: () {})
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: screens[_currentIndexNavigationBar],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndexNavigationBar,
          onTap: (index) {
            setState(() {
              _currentIndexNavigationBar = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
                title: Text('Início'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text('Em alta'), icon: Icon(Icons.whatshot)),
            BottomNavigationBarItem(
                title: Text('Inscrições'), icon: Icon(Icons.subscriptions)),
            BottomNavigationBarItem(
                title: Text('Biblioteca'), icon: Icon(Icons.folder))
          ]),
    );
  }
}
