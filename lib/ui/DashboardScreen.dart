import 'package:flutter/material.dart';
import 'package:food_app/ui/FoodItemCard.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.white,
          ),
          Container(
            width: size.width / 3,
            height: size.height,
            color: Colors.redAccent,
          ),
          AppBar(
            leading: IconButton(
              icon : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Icon(Icons.menu, color: Colors.white,),
              ),
              onPressed: (){

              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              Icon(Icons.shopping_cart, color: Colors.black45,),
              SizedBox(width: 30,)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top : 60),
            child: ListView(
              children: [

                // we are done
                // now add more foods

                FoodItemCard(
                  name: "Pizza",
                  image: "assets/pizza.png",
                  stocks: 3,
                ),
                FoodItemCard(
                  name: "Burger",
                  image: "assets/burger.png",
                  stocks: 13,
                ),
                FoodItemCard(
                  name: "Donut",
                  image: "assets/donuts.png",
                  stocks: 10,
                ),
                FoodItemCard(
                  name: "Pasta",
                  image: "assets/pasta.png",
                  stocks: 3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// thank for watching
// subscribe and like for more videos :)