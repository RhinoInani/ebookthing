import 'package:ebookthing/constants.dart';
import 'package:ebookthing/widgets/rounded_button.dart';
import 'package:ebookthing/widgets/two_side_rounded_button.dart';
import 'package:flutter/material.dart';

class SearchReadCard extends StatelessWidget {
  final title;
  final author;

  const SearchReadCard({Key key, this.title, this.author}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      height: 70,
      width: 370,
      child: Stack(
        children: <Widget>[
          Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 70,
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
            bottom: 0,
            top: 3,
            child: Row(
              children: <Widget>[
                Container(
                  child: RichText(
                    maxLines: 2,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title\n",
                          style: TextStyle(
                              fontSize: 15,
                              color: kBlackColor,
                              fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: author,
                          style: TextStyle(
                              fontSize: 13,
                              color: kLightBlackColor,
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
//                RoundedButton(
//                  text: "Read",
//                  fontSize: 11,
//                  verticalPadding: 10,
//                ),
                Center(
                  child: Builder(
                    builder: (context) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: MediaQuery.of(context).size.width * .08,
                              width: MediaQuery.of(context).size.width * .2,
                              child: RaisedButton(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    side: BorderSide(color: Color(0xFF666666).withOpacity(.1),)
                                ),
                                child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(fontSize: 10),
                                      children: [
                                        TextSpan(text: "Read", style: TextStyle(color: kBlackColor),),
                                      ]
                                  ),
                                ),
                              )
                          )
                        ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
