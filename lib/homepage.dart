import 'package:firebase/app/fire_auth.dart';
import 'package:firebase/deleteaccount.dart';
import 'package:firebase/loginscreen.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(backgroundColor: Colors.white, toolbarHeight: 100,
      ),
      backgroundColor: Colors.white, 
      body:
    Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child:
         Text("Whoops the app is still under construction!", 
        style: TextStyle(
        color: Colors.black,
        fontSize: 20, 
        fontStyle: FontStyle.italic),)),
        SizedBox(height: 10),
        Center(child: Icon(Icons.construction_sharp, size: 60,)),
        
  SizedBox(height: 130),
Row(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Divider(color: Colors.grey[400])),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("For now you can" ,style: TextStyle(color: Colors.black, fontSize: 15),),
                  ),
                  Expanded(child: Divider(color: Colors.grey[400])),
                ],
              ),
        SizedBox(height: 15),
         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
          Align(
       alignment: Alignment.centerRight,
       child: TextButton(
       onPressed: () async {
      await authservices.value.signOut();
      Navigator.pushAndRemoveUntil(
      context,
       MaterialPageRoute(builder: (_) => LoginScreen()),
       (route) => false,
      );
      }, 
                 style: TextButton.styleFrom(
                   padding: EdgeInsets.zero,
                   minimumSize: Size.zero,
                   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                   foregroundColor: Colors.black,
                   overlayColor: Colors.transparent,
                 ),
                 child: const Text(
                   "Log Out",
                   style: TextStyle(fontSize: 16),
                 ),
               ),
             ),  Align(
  alignment: Alignment.centerLeft,
  child: TextButton(
    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteAccountScreen(),));
    },
    style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      foregroundColor: Colors.black,
      overlayColor: Colors.transparent,
    ),
    child: const Text(
      "Delete Account",
      style: TextStyle(fontSize: 16),
    ),
  ),
),

           ],
         ),

      ],
    ),);
  }
}