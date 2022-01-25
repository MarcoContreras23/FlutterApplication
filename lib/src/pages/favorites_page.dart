import 'package:flutter/material.dart';

class FavoritePages extends StatefulWidget {
  FavoritePages({Key? key}) : super(key: key);

  @override
  State<FavoritePages> createState() => _FavoritePagesState();
}

class _FavoritePagesState extends State<FavoritePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Favorite'),
      actions:[
        IconButton(icon: Icon(Icons.favorite), onPressed: (){
          Navigator.pushNamed(context, 'List_favorite');
        })
        ],
    ),
    body: _ListItems(),

  );
  }
}

Widget _bottomNavigationBar(){
  return BottomNavigationBar(
    currentIndex: 0,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favorite',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Search',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  );
}

Widget _ListItems(){
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index){
        return ListTile(
          trailing: Icon(Icons.favorite_border),
          title: Text('Favorite $index'),
        );
      },
    );
  }