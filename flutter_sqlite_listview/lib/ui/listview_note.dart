import 'package:flutter/material.dart';
import 'package:flutter_sqlite_listview/model/note.dart';
import 'package:flutter_sqlite_listview/util/database_helper.dart';
import 'package:flutter_sqlite_listview/ui/note_screen.dart';

class ListViewNote extends StatefulWidget {
  @override
  _ListViewNoteState createState() => new _ListViewNoteState();
}

class _ListViewNoteState extends State<ListViewNote> {
  List<Note> items = new List();
  DatabaseHelper db = new DatabaseHelper();

  @override
  void initState() {
    super.initState();

    db.getAllNotes().then((notes) {
      setState(() {
        notes.forEach((note) {
          items.add(Note.fromMap(note));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 5.0),
                    ListTile(
                      leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                    Flexible(
                    fit: FlexFit.tight,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        radius: 10.0,
                        child: Text(
                          '${items[position].id}',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                      Flexible(
                      fit: FlexFit.tight,
                      child: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => _deleteNote(context, items[position], position)),
                      ),
                        ],
                      ),
                      title:Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text(
                            '${items[position].title}',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                      ),

                      subtitle:Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          '${items[position].description}',
                          style: new TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      onTap: () => _navigateToNote(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _createNewNote(context),
        ),
      ),
    );
  }

  void _deleteNote(BuildContext context, Note note, int position) async {
    db.deleteNote(note.id).then((notes) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToNote(BuildContext context, Note note) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(note)),
    );

    if (result == 'update') {
      db.getAllNotes().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Note.fromMap(note));
          });
        });
      });
    }
  }

  void _createNewNote(BuildContext context) async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(Note('', ''))),
    );

    if (result == 'save') {
      db.getAllNotes().then((notes) {
        setState(() {
          items.clear();
          notes.forEach((note) {
            items.add(Note.fromMap(note));
          });
        });
      });
    }
  }
}
