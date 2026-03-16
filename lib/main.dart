import 'package:flutter/material.dart';

void main() {
  runApp(const Newapp());
}
class Newapp extends StatelessWidget {
  const Newapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:  Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.pink,
        title: Text("ayush ka app"),
        centerTitle: true,

        leadingWidth: 20,

        actions: [
          Icon(Icons.search ),
          Icon(Icons.alarm),
          Icon(Icons.local_phone)
        ],
        leading: CircleAvatar(child: Text("A"),),
      ),
      
      body: Center(
        child: 
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
            width: 300,
            height: 300,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(("Ayush"),style: TextStyle(fontSize: 20),),
          ),

        
      )
    )

    );
  }
}





