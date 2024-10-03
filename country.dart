class Country {
  String countryCode;
  String name;
  String capital;
  String region;
  int population;
  String flag;
  String language;

  Country.fromMap(Map<String, dynamic> countryMap)
      : countryCode = countryMap["cca2"] ?? "null",
        name = countryMap["name"]?["common"] ?? "null",
        capital = (countryMap["capital"] as List<dynamic>).isNotEmpty
            ? countryMap["capital"][0]
            : "null",
        region = countryMap["region"] ?? "null",
        population = countryMap["population"] ?? "null",
        flag = countryMap["flags"]["png"] ?? "null",
        language = (countryMap["languages"] as Map<String, dynamic>).isNotEmpty
            ? (countryMap["languages"] ?? {} as Map<String, dynamic>)
            .entries
            .toList()[0]
            .value
            : "null";
}