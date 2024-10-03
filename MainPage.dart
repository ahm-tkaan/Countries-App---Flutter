import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ulkeler/country.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/favs.dart';
import 'package:ulkeler/pre_list.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final String _apiUrl =
      "https://restcountries.com/v3.1/all?fields=name,flags,cca2,capital,region,languages,population";

  List<Country> _allCountries = [];
  List<String> _favCountriesCode = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _favChecked().then((value) {
        _fetchCountriesFromInternet();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
      backgroundColor: Color(0xFFFDE9F4),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            _getFavsPage(context);
          },
          icon: Icon(Icons.favorite_sharp),
          color: Color(0xFFFDE9F4),
        )
      ],
      title: Text(
        "Countries",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Color(0XFFD9138A),
    );
  }

  Widget _buildBody() {
    return _allCountries.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : preList(_favCountriesCode, _allCountries); // preList sınıfının örneği
  }



  void _fetchCountriesFromInternet() async {
    Uri uri = Uri.parse(_apiUrl);
    http.Response response = await http.get(uri);

    List<dynamic> parsedResponse = jsonDecode(response.body);

    for (int i = 0; i < parsedResponse.length; i++) {
      Map<String, dynamic> countryMap = parsedResponse[i];
      Country country = Country.fromMap(countryMap);
      _allCountries.add(country);
    }

    setState(() {});
  }



  Future<void> _favChecked() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favs = prefs.getStringList("favs");
    if (favs != null) {
      for (String countriesCode in favs) {
        _favCountriesCode.add(countriesCode);
      }
      setState(() {});
    }
  }

  void _getFavsPage(BuildContext context) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) {
      return Favs(_favCountriesCode, _allCountries);
    });
    Navigator.push(context, route);
  }
}
