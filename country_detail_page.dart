import 'package:flutter/material.dart';
import 'package:ulkeler/country.dart';

class CountryDetailPage extends StatelessWidget {
  final Country country;

  CountryDetailPage(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      backgroundColor: Color(0xFFFDE9F4),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        country.name,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0XFFD9138A),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: double.infinity, height: 25),
        _buildFlag(context),
        SizedBox(height: 25),
        _countryName(),
        SizedBox(height: 25),
        _countryDetails()
      ],
    );
  }

  Widget _buildFlag(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        country.flag,
        width: MediaQuery.of(context).size.width / 2,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _countryName() {
    return Text(
      country.name,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    );
  }

  Widget _countryDetails() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          _buildCountryDetailRow("Country Name: ", country.name),
          _buildCountryDetailRow("Capital: ", country.capital),
          _buildCountryDetailRow("Language: ", country.language),
          _buildCountryDetailRow("Region: ", country.region),
          _buildCountryDetailRow("Population: ", country.population.toString())
        ],
      ),
    );
  }

  Widget _buildCountryDetailRow(String title, String detail) {
    return Row(
      children: [
        Expanded(
            flex: 6,
            child: Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
            )),
        Expanded(
            flex: 4,
            child: Text(
              detail,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}