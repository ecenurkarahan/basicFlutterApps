import 'package:flutter/material.dart';

import '../components/EmptyNote.dart';
import '../components/Note.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> notes=["Note 1","Note 2","Note 3","Note 4","Note 5","Note 6","Note 7","Note 8","Note 9","Note 10","Note 11","Note 12","Note 13","Note 14","Note 15","Note 16","Note 17","Note 18","Note 19","Note 20"];
  void _deleteNote(int index){
    setState(() {
      notes.removeAt(index);
    });
  }
  void _addNote (String note){
    setState(() {
      notes.insert(0,note);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Notes')),
      body:Column(
        children: [
           EmptyNote(onAddNote: _addNote),

          Expanded(
            child: ListView.builder(itemCount: notes.length,
                  itemBuilder: (context,index){
                    return Note(
                        text: notes[index],
                        onDelete: ()=> _deleteNote(index)
                    );
                  }),
          ),

        ],
      ) ,
    );
  }
}


