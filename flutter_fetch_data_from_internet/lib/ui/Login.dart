import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Future<List<Album>> fetchAlbum() async {
    final response = await http.get('https://files.milonsheikh.com/albums.json');
    if (response.statusCode == 200) {
      List<Album> albums = List<Album>();
      var parsedAlbumList = json.decode(response.body);
      parsedAlbumList.forEach((album) {
        albums.add(Album.fromJson(album));
      });
      return albums;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Fetch data"),
          centerTitle: false,
          elevation: 8.0,
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (context, position) {
                    return Column(
                     children: <Widget>[
                       Divider(height: 5.0),
                        ListTile(
                          title:Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Text(
                              '${snapshot.data[position].title}',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.indigo,
                              ),
                            ),
                          ),
                        )
                      ]
                    );
                  }
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class Album {
 String userId,id,title;
  Album({this.userId, this.id, this.title});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'].toString(),
    );
  }
}