import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:to_do_app/Screens/first_screen.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  
  @override
  State<SplashScreen> createState() => SplashScreenState();
}


class SplashScreenState extends State<SplashScreen> {
  
 

  @override
  Widget build(BuildContext context) {
         Timer(const Duration(seconds: 4), () { 
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirstScreen()));
        });
    return Container(
      decoration:const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 10, 29, 45),
          Color.fromARGB(255, 2, 46, 52),
          Color.fromARGB(255, 6, 100, 112)
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        )
      ),
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextStyle(style: const TextStyle(
            fontWeight: FontWeight.bold
          ), child:Text('Make your life easier',
          style: GoogleFonts.aBeeZee(
            fontSize: 30,
            color: Colors.white
          ),
          )),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.4,
            child: const Image(image: AssetImage('assets/icon.png'),
            ),
          ),
         Row(mainAxisAlignment: MainAxisAlignment.center,
           children: [
            DefaultTextStyle(style: const TextStyle(
              fontWeight: FontWeight.bold
            ), child: Text('To ',
        style: GoogleFonts.aboreto(
              fontSize: 40,
             // fontWeight: FontWeight.bold,
              color:const Color.fromARGB(255, 24, 16, 100)
        ),
        ),)
          ,  
          DefaultTextStyle(style: const TextStyle(
            fontWeight: FontWeight.bold
          ), child:Text('Do',
          style: GoogleFonts.aboreto(
              fontSize: 40,
             // fontWeight: FontWeight.bold,
              color:const Color.fromARGB(255, 24, 16, 100)
         ))
         ),
           ],
         ),
       const  DefaultTextStyle(style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
         ), child:FlickerNeonText(
          text:'Loading...' ,
            flickerTimeInMilliSeconds: 300,
            textColor: Colors.white,
            spreadColor: Color.fromARGB(255, 10, 42, 68),
         ) )
        ],
      ),
    ); 
    
  }
}