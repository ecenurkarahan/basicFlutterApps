import 'package:flutter/material.dart';
class Note extends StatefulWidget {
  final String text;
  final Function() onDelete;
  const Note({super.key,
    required this.text,
    required this.onDelete,
  });

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool _isCompleted = false;
  void _showOptionsDialog(){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: const Text('Choose an option'),
        actions: <Widget>[
          TextButton(onPressed: ()
      {
        setState(() {
          _isCompleted = !_isCompleted;
        });
        Navigator.of(context).pop();
      }
      , child: const Text('Completed')),
          TextButton(onPressed :() {
            widget.onDelete();
            Navigator.of(context).pop();
          },
              child: const Text('Delete')),
        ],
      );
        });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:_showOptionsDialog,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            decoration: _isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
