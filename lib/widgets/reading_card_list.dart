import 'package:ebookthing/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import 'book_rating.dart';
class ReadingListCard extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final double rating;
  final Function pressDetails;
  final Function pressRead;
  final Function pressFav;
  const ReadingListCard({
    Key key, this.image, this.title, this.author, this.rating, this.pressDetails, this.pressRead, this.pressFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic fav = Icon(Icons.favorite_border);
    double _updateState(){
      fav = Icon(Icons.favorite);
    };
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40,),
      height: 235,
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 222,
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
            ),
          ),
          Positioned(
            left: 24,
            child: Image.asset(
              image,
              width: 90,
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: (){
                    pressFav;
                    _updateState();
                  },
                ),
                BookRating(score: rating,),
              ],
            ),
          ),
          Positioned(
            top: 150,
            child: Container(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 3,
                      text: TextSpan(
                        style: GoogleFonts.notoSerif(color: kBlackColor),
                        children: [
                          TextSpan(
                              text: "$title",
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: "$author",
                              style: TextStyle(
                                fontSize: 10,
                                color: kLightBlackColor,
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: pressDetails,
                        child: Container(
                          width: 101,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          child: Text("Details", style: GoogleFonts.notoSerif(fontSize: 12.8),),
                        ),
                      ),
                      Expanded(
                        child: TwoSideRoundedButton(
                          text: "Read",
                          press: pressRead,
                          radius: 29,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}