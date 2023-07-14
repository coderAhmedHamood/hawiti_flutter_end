//
// class CountryModel {
//   CountryModel({
//     // required this.code,
//      required this.data,
//   });
//   // late final int code;
//   late   List<Country> data=[];
//
//   CountryModel.fromJson(Map<String, dynamic> json){
//     if (json['data'] != null) {
//       data= <Country>[];
//       json['data'].forEach((v) {
//         data.add(Country.fromJson(v));
//       });
//     }
//     // data.addAll(json['data'].foreach((e)=>Data.fromJson(e)).toList()) ;
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     // _data['code'] = code;
//     if(data.isNotEmpty) {
//       print('to json country');
//       _data['data'] = data.map((e) => e.toJson()).toList();
//     }
//     else{
//       _data['data'] = [];
//     }
//     return _data;
//   }
// }
//
// class Country {
//   Country({
//     required this.id,
//     required this.name,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.provinces,
//   });
//   late final int id;
//   late final String name;
//   late final String createdAt;
//   late final String updatedAt;
//   late final List<Provinces> provinces;
//
//   Country.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     provinces = List.from(json['provinces']).map((e)=>Provinces.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['provinces'] = provinces.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Provinces {
//   Provinces({
//     required this.id,
//     required this.name,
//     required this.countryId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.directories,
//   });
//   late final int id;
//   late final String name;
//   late final int countryId;
//   late final String createdAt;
//   late final String updatedAt;
//   late final List<Directories> directories;
//
//   Provinces.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     countryId = json['country_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     directories = List.from(json['directories']).map((e)=>Directories.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['country_id'] = countryId;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     if(directories.isNotEmpty){
//       _data['directories'] = directories.map((e)=>e.toJson()).toList();
//     }
//     _data['directories'] = [];
//     // _data['directories'] = directories.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Directories {
//   Directories({
//     required this.id,
//     required this.name,
//     required this.provinceId,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//   late final int id;
//   late final String name;
//   late final int provinceId;
//   late final String createdAt;
//   late final String updatedAt;
//
//   Directories.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     provinceId = json['province_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['province_id'] = provinceId;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }

class CountryModel {
  CountryModel({
    // required this.code,
    required this.data,
  });
  late final int code;
  late final List<Country> data;

  CountryModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    data = List.from(json['data']).map((e)=>Country.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Country {
  Country({
    required this.id,
    required this.name,
    required this.nationality,
    required this.createdAt,
    required this.updatedAt,
    required this.provinces,
  });
  late final int id;
  late final String name;
  late final String nationality;
  late final String createdAt;
  late final String updatedAt;
  late final List<Provinces> provinces;

  Country.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    nationality = json['nationality'];
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    provinces = List.from(json['provinces']).map((e)=>Provinces.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nationality'] = nationality;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['provinces'] = provinces.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Provinces {
  Provinces({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
    required this.directories,
  });
  late final int id;
  late final String name;
  late final int countryId;
  late final String createdAt;
  late final String updatedAt;
  late final List<Directories> directories;

  Provinces.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    directories = List.from(json['directories']).map((e)=>Directories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country_id'] = countryId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['directories'] = directories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Directories {
  Directories({
    required this.id,
    required this.name,
    required this.provinceId,
    required this.createdAt,
    required this.updatedAt,
    required this.branches,
  });
  late final int id;
  late final String name;
  late final int provinceId;
  late final String createdAt;
  late final String updatedAt;
  late final List<Branches> branches;

  Directories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    branches = List.from(json['branches']).map((e)=>Branches.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['province_id'] = provinceId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['branches'] = branches.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Branches {
  Branches({
    required this.id,
    required this.name,
    required this.provinceId,
    required this.directorateId,
    required this.managerName,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int provinceId;
  late final int directorateId;
  late final String managerName;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;

  Branches.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
    directorateId = json['directorate_id'];
    managerName = json['manager_name']??"";
    userId = json['user_id']??0;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['province_id'] = provinceId;
    _data['directorate_id'] = directorateId;
    _data['manager_name'] = managerName;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}