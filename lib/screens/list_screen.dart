import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/config/palette.dart';
import 'package:todoapp/screens/add_task.dart';
import 'package:todoapp/screens/profile_screen.dart';
import 'package:todoapp/screens/sign_in_up_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Tasks ",),
        backgroundColor:const Color(0xFF3b5999),
        actions: [
          IconButton(icon: const Icon(Icons.person), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const ProfileScreen();
            }));
          },),
          IconButton(icon: const Icon(Icons.logout),  onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
              return const SignInUpScreen();
            }),
            );

          },),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { 
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return const AddTask();
        }),
        );
      },
        child: const Icon(Icons.add,),
        backgroundColor: const Color(0xFF3b5999),

      ),
      body: Container(
        color: Palette.backgroundColor,
      ),
    );
  }
}
