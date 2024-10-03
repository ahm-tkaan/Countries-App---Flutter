import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulkeler/country.dart';
import 'package:ulkeler/country_detail_page.dart';

class preList extends StatefulWidget {

  List<Country> _countries = [];
  List<String> _favCountriesCode = [];

  preList(this._favCountriesCode,this._countries);



  @override
  State<preList> createState() => _preListState();
}

class _preListState extends State<preList> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: widget._countries.length, itemBuilder: _buildListItem);
  }

  Widget? _buildListItem(BuildContext context, int index) {
    Country country = widget._countries[index];
    return Card(
      child: ListTile(
        title: Text(country.name),
        subtitle: Text("Capital: ${country.capital}"),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(country.flag),
        ),
        trailing: IconButton(
            onPressed: () {
              _favButtonClikced(country);
            },
            icon: Icon(
              widget._favCountriesCode.contains(country.countryCode)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
              color: Color(0XFFD9138A),
            )),
        onTap: () {
          _countryTapped(context, country);
        },
      ),
    );
  }

  void _favButtonClikced(Country country) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (widget._favCountriesCode.contains(country.countryCode)) {
      widget._favCountriesCode.remove(country.countryCode);
    } else {
      widget._favCountriesCode.add(country.countryCode);
    }

    await prefs.setStringList("favoriler ", widget._favCountriesCode);
    setState(() {});
  }

  void _countryTapped(BuildContext context, Country country) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) {
      return CountryDetailPage(country);
    });
    Navigator.push(context, route);
  }
}
