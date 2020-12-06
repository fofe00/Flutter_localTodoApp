import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:todo1/TodosModel.dart';
import 'package:todo1/TaskModel.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "eeee",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ChangeNotifierProvider(
        create:(context)=> TodoModel(),
        child: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: Text("todo 1"),
      ),
      body: Column(
        children: <Widget>[
        SizedBox(
          height: 50,
        ),
          Expanded(
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight:Radius.circular(50),
                      topLeft: Radius.circular(50)
                  ),
                color: Colors.white,
              ),
              child: Consumer<TodoModel>(
                  builder: (context,todo,child){
                    return ListView.builder(
                      itemCount: todo.tasklist.length,
                      itemBuilder: (context,index){
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 32,right: 32,top: 8,bottom: 8),
                            title: Text(todo.tasklist[index].title,
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(todo.tasklist[index].detail,
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(Icons.check_circle,color: Colors.greenAccent,),
                          ),
                          margin: EdgeInsets.only(bottom: 8,left: 16,right: 16),
                        );
                      },
                    );
                  },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Provider.of<TodoModel>(context,listen:false).addTaskList();
          },
        child: Icon(Icons.navigation),
          backgroundColor: Colors.blue,
      ),
    );
  }
}




