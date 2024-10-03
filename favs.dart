import 'package:flutter/material.dart';
import 'package:ulkeler/country.dart';
import 'package:ulkeler/pre_list.dart';



class Favs extends StatefulWidget {


  final List<Country> _allCountries ;
  final List<String> _favCountriesCode ;



  Favs(this._favCountriesCode,this._allCountries);

  @override
  State<Favs> createState() => _FavsState();
}

class _FavsState extends State<Favs> {
  List<Country> _favCountry = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  for(Country country in widget._allCountries){
    if(widget._favCountriesCode.contains(country.countryCode)){
      _favCountry.add(country);
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
        backgroundColor: Color(0xFFFDE9F4)
    );
  }

 AppBar _buildAppBar() {
    return AppBar(
      title: Text("Favs",
      style: TextStyle(color: Colors.white),
    ),
   backgroundColor: Color(0XFFD9138A),
   centerTitle: true,
   );


 }

  _buildBody() {
    return    preList(widget._favCountriesCode, _favCountry);


  }
}
