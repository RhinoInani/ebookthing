import 'package:ebookthing/constants.dart';
import 'package:ebookthing/main.dart';
import 'package:ebookthing/screens/details_screen.dart';
import 'package:ebookthing/screens/read_screen.dart';
import 'package:ebookthing/screens/read_screen2.dart';
import 'package:ebookthing/screens/read_screenV2.dart';
import 'package:ebookthing/screens/read_screenV3.dart';
import 'package:ebookthing/widgets/book_rating.dart';
import 'package:ebookthing/widgets/reading_card_list.dart';
import 'package:ebookthing/widgets/reading_card_list_try.dart';
import 'package:ebookthing/widgets/two_side_rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  dynamic _colors = Colors.grey;
  int _currentIndex = 0;
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/main_page_bg.png"),
                      alignment: Alignment.topCenter,
                      fit: BoxFit.fitWidth,
                  ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.notoSerif(textStyle: Theme.of(context).textTheme.display1),
                          children: [
                            TextSpan(
                              text: "What are you \nreading "
                            ),
                            TextSpan(
                              text: "today?",
                                style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                            )
                          ],
                        ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        ReadingListCardTry(
                          image: "assets/PercyJacksonBook1.jpg",
                          title: "Percy Jackson and the Lightning Thief\n",
                          author: "Rick Riordan",
                          pressDetails: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return DetailsScreen(
                                        chapterName: "I Accidentally Vaporized",
                                        chapterName2: "Three Old Ladies Knit",
                                        chapterName3: "Grover Unexpectedly",
                                        chapterName4: "My Mother Teaches",
                                        bookTitle: "Percy Jackson and ",
                                        bookTitleBold: "The Lightning Thief",
                                        bookCover: "assets/PercyJacksonBook1.jpg",
                                        readScreenNum: "assets/PJBook1.pdf",
                                        summary: "On the first day of summer, just after his sixth-grade year, Percy discovers that something is wrong with him. Or rather, something is right with him. He learns that he is a half-blood: half-human, half-god. He is taken to Camp Half-Blood in New York, a camp for kids just like him that is safe from monsters that like to attack half-bloods.",
                                      );
                                    }
                                )
                            );
                          },
                          pressRead: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return ReadWidget(thing: "https://greekpercyjackson.weebly.com/uploads/4/6/4/4/46440761/the_lightning_thief.pdf");
                                }
                              )
                            );
                          },
                          rating: 4.9,
                        ),
                        ReadingListCard(
                          image: "assets/PercyJacksonBook2.jpg",
                          title: "Percy Jackson and the Sea of Monsters\n",
                          author: "Rick Riordan",
                          pressDetails: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return DetailsScreen(
                                        chapterName: "My Best Friend Shops\nFor Wedding Dress",
                                        chapterName2: "I Play Dodge Ball \nwith Cannabils",
                                        chapterName3: "We Hail the Taxi of \nEternal Torment",
                                        chapterName4: "Tyson Plays with Fire",
                                        bookTitle: "Percy Jackson and ",
                                        bookTitleBold: "The Sea of Monsters",
                                        bookCover: "assets/PercyJacksonBook2.jpg",
                                        readScreenNum: "assets/PJBook2.pdf",
                                        summary: "On the first day of summer, just after his sixth-grade year, Percy discovers that something is wrong with him. Or rather, something is right with him. He learns that he is a half-blood: half-human, half-god. He is taken to Camp Half-Blood in New York, a camp for kids just like him that is safe from monsters that like to attack half-bloods.",
                                      );
                                    }
                                )
                            );
                          },
                          pressRead: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return ReadWidget(thing: "https://greekpercyjackson.weebly.com/uploads/4/6/4/4/46440761/percy_jackson_2_-_the_sea_of_monsters_-_riordan__rick.pdf");
                                    }
                                )
                            );
                          },
                          rating: 4.8,
                        ),
                        ReadingListCard(
                          image: "assets/PercyJacksonBook4.jpg",
                          title: "Percy Jackson and the Battle of Labyrinth\n",
                          author: "Rick Riordan",
                          pressDetails: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return DetailsScreen(
                                        chapterName: "I Battle A Cheerleading \nSquad",
                                        chapterName2: "The Underworld Sends Me \n A Prank Call",
                                        chapterName3: "We Play Tag with Scorpions",
                                        chapterName4: "Annabeth Breaks the Rules",
                                        bookTitle: "Percy Jackson and ",
                                        bookTitleBold: "The Battle of Labyrinth",
                                        bookCover: "assets/PercyJacksonBook4.jpg",
                                        readScreenNum: "assets/PJBook4.pdf",
                                        summary: "On the first day of summer, just after his sixth-grade year, Percy discovers that something is wrong with him. Or rather, something is right with him. He learns that he is a half-blood: half-human, half-god. He is taken to Camp Half-Blood in New York, a camp for kids just like him that is safe from monsters that like to attack half-bloods.",
                                      );
                                    }
                                )
                            );
                          },
                          pressRead: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context){
                                      return ReadScreen(thing: "assets/PJBook4.pdf");
                                    }
                                )
                            );
                          },
                          rating: 4.8,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                  style: GoogleFonts.notoSerif(textStyle: Theme.of(context).textTheme.display1),
                                children: [
                                  TextSpan(
                                    text: "Best of"
                                  ),
                                  TextSpan(
                                    text: " today",
                                    style: TextStyle(fontWeight: FontWeight.bold)
                                  )
                                ]
                              )
                            ),
                            bestOfTheDayCard(size, context),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.notoSerif(textStyle: Theme.of(context).textTheme.display1),
                                children: [
                                  TextSpan(
                                    text: "Continue ",
                                  ),
                                  TextSpan(
                                    text: "reading...",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ]
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(38.5),
                                boxShadow: [
                                  BoxShadow(offset: Offset(0,10),
                                    blurRadius: 33,
                                    color: Color(0xFFD3D3D3).withOpacity(.84),
                                  ),
                                ]
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(38.5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20, right: 20),
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    "Percy Jackson and The Lightning Thief",
                                                    style: GoogleFonts.notoSerif(
                                                      textStyle: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: kBlackColor
                                                      )
                                                    ),
                                                  ),
                                                  Text(
                                                    "Rick Riordan",
                                                    style: GoogleFonts.notoSerif(fontSize: 12.0,textStyle: TextStyle(
                                                      color: kLightBlackColor,
                                                    )
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment: Alignment.bottomRight,
                                                    child: Text(
                                                      "Chapter 7 of 11",
                                                      style: GoogleFonts.notoSerif(textStyle: TextStyle(
                                                        fontSize: 10,
                                                        color: kLightBlackColor,
                                                      ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  )
                                                ],
                                              ),
                                            ),
                                            Image.asset(
                                              "assets/PercyJacksonBook1.jpg",
                                              height: 65,
                                              width: 55,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 7,
                                      width: size.width * .65,
                                      decoration: BoxDecoration(
                                        color: kProgressIndicator,
                                        borderRadius: BorderRadius.circular(7)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 40,)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: _currentIndex,
//        showUnselectedLabels: true,
//        unselectedFontSize: 12,
//        selectedFontSize: 12,
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home, color: _colors,),
//            title: Text("Home", style: TextStyle(color: _colors)),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.favorite, color: _colors,),
//            title: Text("Favorites", style: TextStyle(color: _colors),),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.search, color: _colors,),
//            title: Text("Search", style: TextStyle(color: _colors),)
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.collections_bookmark, color: _colors,),
//            title: Text("Recommended", style: TextStyle(color: _colors),)
//          )
//        ],
//        onTap: (index){
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//      ),
    );
  }
  
  Container bestOfTheDayCard(Size size, BuildContext context) {
    return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      height: 172,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 24,
                                top: 22,
                                right: size.width * .365,
                              ),
                              height: 172,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(29),
                                boxShadow:[
                                  BoxShadow(
                                    offset: Offset(0,10),
                                    blurRadius: 33,
                                    color: kShadowColor,
                                  )
                                ],
                              ),
//                                 BoxDecoration(
//                                color: Colors.grey[300].withOpacity(.45),
//                                borderRadius: BorderRadius.circular(29),
//                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "New York Times Best for Today",
                                    style: GoogleFonts.notoSerif(
                                      fontSize: 10,
                                      color: kLightBlackColor,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Percy Jackson and \nThe Titan's Curse",
                                    style: GoogleFonts.notoSerif(textStyle: Theme.of(context).textTheme.title,fontSize: 15)
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Rick Riordan",
                                    style: GoogleFonts.notoSerif(color: kLightBlackColor, fontSize: 11.8),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: <Widget>[
                                      BookRating(score: 4.9,),
                                      SizedBox(width: 10,),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 40,
                            top: 5,
                            child: Image.asset(
                              "assets/PercyJacksonBook3.jpg",
                              width: size.width *.25,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 30,
                            child: SizedBox(
                              height: 40,
                              width: size.width * .3,
                              child: TwoSideRoundedButton(
                                text: "Read",
                                radius: 29,
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context){
                                            return ReadScreen(thing:"assets/PJBook3.pdf",);
                                          }
                                      )
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    );
  }
}