import '../model/country_model.dart';

class CountryResponse{
  var countries=<Country>[];
  late int lastPage;
  CountryResponse.fromJson(Map<String,dynamic> json){
    json["data"].forEach((cat) =>countries.add(Country.fromJson(cat)));
    // lastPage=json[""]
  }
}