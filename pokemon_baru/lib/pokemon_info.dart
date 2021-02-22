import 'package:flutter/material.dart';
import 'pokemon.dart';

///THIS CONTAIN DETAIL OF EVERY POKEMON
// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  Pokemon pokemon;

  Color bgColor = Color(0xFF171515);
  DetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:bgColor,
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          tooltip: "Return to list",
          onPressed: (){
            Navigator.pop(context,true);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: pokemon == null ?  Center(child: Text('NaN'),) : Center(child: Text('#0${pokemon.id.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: Colors.white
              ),
            )),
          )
        ],

      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250,
                decoration:BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(175),bottom: Radius.circular(175))
                ),
                // child:   Image.asset('assets/tes4.png',
                //   height:250//MediaQuery.of(context).size.height/3,
                //   ,fit:BoxFit.cover,
                //
                // ),
              ),

              Positioned(
                child: CircleAvatar(radius: 100,
                  backgroundColor: Colors.white54,
                  backgroundImage:NetworkImage(pokemon.sprites.frontDefault),
                ),
              )
            ],
          ),
          SizedBox(height: 12),
          Text(pokemon.name,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                color: Colors.white,
                letterSpacing: 3
            ),
          ),

          SizedBox(height: 10,),
          Expanded(
            flex: -1,
            child: Container(
              height: 120,
              child: ListView.builder(
                  itemCount: pokemon.types.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,

                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(horizontal: 120,vertical: 8),
                      child: Text(pokemon.types[index].type.name,style: TextStyle(color: Colors.white,fontSize: 20,     letterSpacing: 5),),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(30)),
                    );
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('${pokemon.weight/10} KG',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,)
                  ),
                  Text('Weight',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        color: Colors.white70,)
                  ),
                ],
              ),
              Column(
                children: [
                  Text('${pokemon.height/10} M',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,)
                  ),
                  Text('Height',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white70,)
                  ),
                ],
              ),

            ],
          ),
          SizedBox(height: 12,),
          Text("Base Stats",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 30,
                color: Colors.white,
                decoration: TextDecoration.underline,
                letterSpacing: 2
            ),
          ),
          SizedBox(height: 12,),
          Expanded(
            child: ListView.builder(
                itemCount: pokemon.stats.length,
                itemBuilder: (context,index){
                  final poke = pokemon.stats[index];

                  return Column(
                    children: [
                      Text('${poke.stat.name} = ${poke.baseStat}',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: 1

                        ),
                      ),
                      SizedBox(height: 3,)
                    ],
                  );
                }
            ),
          )




        ],
      ),

    );
  }
}

