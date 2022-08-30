import 'package:flutter/material.dart';

class todo_app extends StatefulWidget {
  @override
  _todo_appState createState() => _todo_appState();
}

var output = '';
List<dynamic> lst = [];

class _todo_appState extends State<todo_app> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo App'),
        ),
        body: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: Colors.pink[100],
                margin: EdgeInsets.only(top: 10),
                child: ListTile(
                  title: Text('${lst[index]}'),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit Todo Item'),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                            },
                                            child: Text('Edit Item')),
                                      ],
                                    );
                                  });
                            },
                            child: Icon(Icons.edit)),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            child: Text('ADD'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add Todo Item'),
                      content: TextField(
                        onChanged: (value) {
                          output = value;
                        },
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                lst.add(output);
                              });
                            },
                            child: Text('Add Todo'))
                      ],
                    );
                  });
            }),
      ),
    );
  }
}
