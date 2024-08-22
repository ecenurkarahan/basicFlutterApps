import 'package:flutter/material.dart';

class EmptyNote extends StatefulWidget {
  final Function(String) onAddNote;
  const EmptyNote({super.key,
  required this.onAddNote,
  });

  @override
  State<EmptyNote> createState() => _EmptyNoteState();
}

class _EmptyNoteState extends State<EmptyNote> {
  final textController = TextEditingController();

  void _addNote(){
    String noteText = textController.text;
    if(noteText.isNotEmpty){
      widget.onAddNote(noteText);
      textController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Enter your note',
                border: OutlineInputBorder(),
              ),
              controller: textController,
            ),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            onPressed: _addNote,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
/*
return Scaffold(
body: Container(
color: Colors.blue,
child: Row(
children:[ TextField(
controller: textController,
),
FloatingActionButton(onPressed: _addNote,
child: const Icon(Icons.add),
)]
),
)
);*/