import 'package:ebookthing/screens/main_screen.dart';
import 'package:ebookthing/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kBlackColor)
      ),
      home: WelcomeScreen(),
    );
  }
}
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Bitmap.png"),
              fit: BoxFit.fill,
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
                text: TextSpan(
                  style: GoogleFonts.notoSerif(fontSize: 50, wordSpacing: .5, color: kBlackColor),
                  // Theme.of(context).textTheme.display3
                  children: [
                    TextSpan(
                        text: "flamin",
                    ),
                    TextSpan(
                      text: "go.",
                      style: TextStyle(fontWeight: FontWeight.bold)
                    )
                  ],
                )
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: RoundedButton(
                text: "start reading",
                fontSize: 20,
                press: (){Navigator.push(context, MaterialPageRoute(builder: (context){return MainScreen();},),);},
              ),
            )
          ],
        ),
      ),
    );
  }
}