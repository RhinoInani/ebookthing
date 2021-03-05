import 'package:ebookthing/widgets/favorites_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScrn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height  * 0.05,),
            RichText(
              text: TextSpan(
                style: GoogleFonts.notoSerif(textStyle: Theme.of(context).textTheme.display1),
                children: [
                  TextSpan(
                    text: "Your "
                  ),
                  TextSpan(
                    text: "Favorites",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ]
              ),
            ),
            FavoriteCard(),
          ],
        ),
      ),
    );
  }
}
