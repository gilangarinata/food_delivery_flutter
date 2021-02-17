import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodItemCard extends StatefulWidget {
  String name;
  String image;
  int stocks;

  FoodItemCard({this.name, this.image, this.stocks});

  @override
  _FoodItemCardState createState() => _FoodItemCardState();
}

class _FoodItemCardState extends State<FoodItemCard> {
  bool tapped = false;
  double heightCard = 150;
  double widthCardPercent = 0.90;
  double cardImageSize = 80.0;
  double titleFontSize = 48.0;
  double stockFontSize = 14.0;
  double ratingBarSize = 20;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: heightCard + 10,
      width: size.width,
      child: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTapUp: (value) {
                setState(() {
                  tapped = false;
                });
              },
              onTapDown: (value) {
                setState(() {
                  tapped = true;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.only(left: 40, right: 30),
                duration: Duration(microseconds: 275),
                height: tapped ? heightCard - 10 : heightCard,
                width: tapped
                    ? size.width * widthCardPercent - 0.3
                    : size.width * widthCardPercent,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 15.0,
                          spreadRadius: 5.0)
                    ]),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize:
                                tapped ? titleFontSize - 1 : titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: tapped ? ratingBarSize - 1 : ratingBarSize,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: null),
                      SizedBox(height: 10,),
                      Text(
                        "${widget.stocks} items.",
                        style: TextStyle(
                          fontSize: tapped ? stockFontSize - 1 : stockFontSize
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                widget.image,
                fit: BoxFit.fill,
                width: tapped ? cardImageSize - 5 : cardImageSize,
                height: tapped ? cardImageSize - 5 : cardImageSize,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
              elevation: 5.0,
              margin: EdgeInsets.all(10.0),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Icon(
                  Icons.arrow_forward_ios_sharp, color: Colors.redAccent,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)
              ),
              elevation: 5.0,
              margin: EdgeInsets.all(10.0),
            ),
          )
        ],
      ),
    );
  }
}
