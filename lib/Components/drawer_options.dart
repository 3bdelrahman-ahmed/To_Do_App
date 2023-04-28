import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerOptions extends StatelessWidget{
  final IconData icon;
  final String text;
  const DrawerOptions({super.key, required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        null;
      },
      child: Container(
        margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.035,left:MediaQuery.of(context).size.width*0.05 ),
        child: Row(
          children: [
              Icon(icon,
              color: Colors.white,
              size: MediaQuery.of(context).size.width*0.065,
              ),
              const SizedBox(width: 25,),
             Text(text,
              style: GoogleFonts.aBeeZee(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              )
          ],
        ),
      ),
    );
  }
}