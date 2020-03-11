import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tesis/coin_model.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color(0xFF1abc9c),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet"),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: (){},
          ),
        ],
        elevation: 0,
        backgroundColor: Color.fromARGB(154, 30, 0, 255),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text("joserojas@gmail.com"),
              accountName: Text("José Gregorio Rojas"),
              currentAccountPicture: CircleAvatar(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: NetworkImage("https://i0.pngocean.com/files/240/77/147/maplestory-mushroom-music-tutor-sight-reading-mushrooms.jpg"),
                    )
                ),
              ),
            ),
            ListTile(
              title: Text("Home"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Prices"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Account"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Settings"),
              onTap: (){},
            ),
            ListTile(
              title: Text("Help"),
              onTap: (){},
            ),

          ],
        ),
      ),

      body: Container(
        color: Color(0xFFbdc3c7),
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(


          child: Column(
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(bottom: 10,),
                decoration: BoxDecoration(
                    color: Color.fromARGB(154, 30, 0, 255),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                ),
                child: Container(

                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Current Balance",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text("USD",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("\$30,37",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF2ecc71),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 2),
                              child: Text("+ 3.5 %",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 80,),

                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Row(
                          children: <Widget>[
                            Text("3.2644915 ETH",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40,),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf1c40f),
                        Color(0xFF8e44ad),
                      ],
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Expanded(
                      child: RaisedButton.icon(
                        onPressed: (){
                        },
                        icon: Icon(FontAwesomeIcons.levelUpAlt,
                          color: Color(0xFF3498db),),
                        label: Text("Send"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    SizedBox(width: 20,),

                    Expanded(
                      child: RaisedButton.icon(
                        onPressed: (){
                        },
                        icon: Icon(FontAwesomeIcons.levelDownAlt,
                          color: Color(0xFF2ecc71),),
                        label: Text("Receive"),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.topLeft,
                child: Text("Currency",style: TextStyle(fontSize: 22),),
              ),

              Container(
                child: FutureBuilder <List<Coin>> (
                    future: getCoins(),
                    builder: (BuildContext context, dynamic snapshot){

                      if(snapshot.hasData){
                        return Container(
                            child: Center(
                                child: Text('tengo datos')
                            )
                        );
                      }

                      return Container(
                        child: Center(
                          child: Text('No hay datos'),
                        ),
                      );
                    }
                ),
              ),


              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
                alignment: Alignment.topLeft,
                child: Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFF2c3e50),
                        child: Icon(FontAwesomeIcons.ethereum,
                          color: Color(0xFF2980b9),),
                      ),
                      title: Text("Etherium"),
                      trailing: Text("\$202,02"),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFFecf0f1),
                          child: Icon(FontAwesomeIcons.ethereum,
                            color: Color(0xFF27ae60),),
                        ),
                        title: Text("Etherium Classic"),
                        trailing: Text("\$6,85"),
                      ),
                    ),

                    SizedBox(height: 20,),

                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Color(0xFF3498db),
                          child: Icon(FontAwesomeIcons.ethereum,
                            color: Color(0xFFecf0f1),),
                        ),
                        title: Text("Ether Zero"),
                        trailing: Text("\$0,021483"),
                      ),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 100,),

            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.wallet),
            title: Text("Wallet"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ticketAlt),
            title: Text("Coupans"),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Text("Account"),
          ),
        ],
        currentIndex: 0,
        onTap: (i) {},
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        backgroundColor: Color.fromARGB(154, 30, 0, 255),
      ),
    );
  }

  Future<List<Coin>> getCoins() async{
    List<Coin> _jsonListMap;

    String api = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=00280d57-72e8-4d65-b9dd-d5a4410dec58";

    final response = await http.get(api);

    if(response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      _jsonListMap = jsonList.map((dynamic i) => Coin.fromJson(i)).toList();
      return _jsonListMap;

    }
  }
}