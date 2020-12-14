import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/TodoModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF00519F),
        scaffoldBackgroundColor: Color(0xFF00519F),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TodoModel(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final time = DateTime.now();

  String get timeFormat {
    String time = this.time.toIso8601String().substring(11, 16);
    return time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Todo Application'),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$timeFormat PM',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                Text(
                  'Current Time',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Consumer<TodoModel>(
                builder: (context, todo, child){
                  return ListView.builder(
                    itemCount: todo.taskList.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                          title: Text(todo.taskList[index].title),
                          subtitle: Text(todo.taskList[index].detail),
                          trailing: Icon(Icons.check_circle, color: Colors.greenAccent,),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Provider.of<TodoModel>(context, listen: false).addTaskInList();
        },
      ),
    );
  }
}
