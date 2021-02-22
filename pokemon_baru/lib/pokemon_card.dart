import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'pokemon.dart';
import 'pokemon_info.dart';

class PokeCard extends StatefulWidget {

  const PokeCard({Key key , this.pokeURL}) : super(key: key);
  final String pokeURL;

  @override
  _PokeCardState createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Pokemon pokemon;



  _fetchData() async{
    final response = await http.get(widget.pokeURL);
    final decode = json.decode(response.body);
    final data = Pokemon.fromJson(decode);

    setState(() {
      pokemon = data;
    });
  }

  void initState(){
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
      child:  Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
            ),
            color: Colors.blueAccent,
            child: InkWell(
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) => DetailPage(pokemon)));
              },
              child: pokemon == null ? Center(
                child: CircularProgressIndicator(),
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Image.network(pokemon.sprites.frontDefault,
                    width: 130,
                    fit: BoxFit.fill,

                  ),

                  Text(pokemon.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                  )
                ],
              ),
            )
          ),
      );
  }
}



