import 'country_model.dart';

class AllRequestData {
  AllRequestData({
    required this.id,
    required this.family,
  });
  late final Id id;
  late final Family family;

  AllRequestData.fromJson(Map<String, dynamic> json){
    id = Id.fromJson(json['id']);
    family = Family.fromJson(json['family']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id.toJson();
    _data['family'] = family.toJson();
    return _data;
  }
}

class Id {
  Id({
    required this.id,
    required this.barcode,
    required this.personId,
    required this.requestDate,
    this.requestStatus,
    this.requestResult,
    required this.branchId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    required this.person,
  });
  late final int id;
  late final String barcode;
  late final int personId;
  late final String requestDate;
  late final Null requestStatus;
  late final Null requestResult;
  late final int branchId;
  late final Null userId;
  late final Null createdAt;
  late final Null updatedAt;
  late final Person person;

  Id.fromJson(Map<String, dynamic> json){
    id = json['id'];
    barcode = json['barcode'];
    personId = json['person_id'];
    requestDate = json['request_date'];
    requestStatus = null;
    requestResult = null;
    branchId = json['branch_id'];
    userId = null;
    createdAt = null;
    updatedAt = null;
    person = Person.fromJson(json['person']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['barcode'] = barcode;
    _data['person_id'] = personId;
    _data['request_date'] = requestDate;
    _data['request_status'] = requestStatus;
    _data['request_result'] = requestResult;
    _data['branch_id'] = branchId;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['person'] = person.toJson();
    return _data;
  }
}

class Person {
  Person({
    required this.id,
    required this.requestStatus,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.fourthName,
    required this.nickName,
    required this.nationality,
    required this.motherNationality,
    required this.fatherNationality,
    required this.motherFullName,
    required this.gender,
    required this.dateOfBirth,
    required this.maritalStatus,
    this.bloodType,
    this.educationStatus,
    this.educationLevel,
    this.religion,
    this.specilaization,
    this.phone,
    this.imagePath,
    this.employer,
    required this.requestDate,
    this.resultRequest,
    this.userId,
    this.createdAt,
    this.updatedAt,
    required this.address,
  });
  late final int id;
  late final String requestStatus;
  late final String firstName;
  late final String secondName;
  late final String thirdName;
  late final String fourthName;
  late final String nickName;
  late final String nationality;
  late final String motherNationality;
  late final String fatherNationality;
  late final String motherFullName;
  late final int gender;
  late final String dateOfBirth;
  late final String maritalStatus;
  late final Null bloodType;
  late final Null educationStatus;
  late final Null educationLevel;
  late final Null religion;
  late final Null specilaization;
  late final Null phone;
  late final Null imagePath;
  late final Null employer;
  late final String requestDate;
  late final Null resultRequest;
  late final Null userId;
  late final Null createdAt;
  late final Null updatedAt;
  late final List<Address> address;

  Person.fromJson(Map<String, dynamic> json){
    id = json['id'];
    requestStatus = json['request_status'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    thirdName = json['third_name'];
    fourthName = json['fourth_name'];
    nickName = json['nick_name'];
    nationality = json['nationality'];
    motherNationality = json['mother_nationality'];
    fatherNationality = json['father_nationality'];
    motherFullName = json['mother_full_name'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    maritalStatus = json['marital_status'];
    bloodType = null;
    educationStatus = null;
    educationLevel = null;
    religion = null;
    specilaization = null;
    phone = null;
    imagePath = null;
    employer = null;
    requestDate = json['request_date'];
    resultRequest = null;
    userId = null;
    createdAt = null;
    updatedAt = null;
    address = List.from(json['address']).map((e)=>Address.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['request_status'] = requestStatus;
    _data['first_name'] = firstName;
    _data['second_name'] = secondName;
    _data['third_name'] = thirdName;
    _data['fourth_name'] = fourthName;
    _data['nick_name'] = nickName;
    _data['nationality'] = nationality;
    _data['mother_nationality'] = motherNationality;
    _data['father_nationality'] = fatherNationality;
    _data['mother_full_name'] = motherFullName;
    _data['gender'] = gender;
    _data['date_of_birth'] = dateOfBirth;
    _data['marital_status'] = maritalStatus;
    _data['blood_type'] = bloodType;
    _data['education_status'] = educationStatus;
    _data['education_level'] = educationLevel;
    _data['religion'] = religion;
    _data['specilaization'] = specilaization;
    _data['phone'] = phone;
    _data['image_path'] = imagePath;
    _data['employer'] = employer;
    _data['request_date'] = requestDate;
    _data['result_request'] = resultRequest;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['address'] = address.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Address {
  Address({
    required this.id,
    required this.personId,
    required this.countryId,
    required this.provinceId,
    required this.directorateId,
    required this.neighborhood,
    required this.street,
    required this.home,
    required this.type,
    required this.source,
    required this.createdAt,
    required this.updatedAt,
    required this.country,
    required this.city,
    required this.directory,
  });
  late final int id;
  late final int personId;
  late final int countryId;
  late final int provinceId;
  late final int directorateId;
  late final String neighborhood;
  late final String street;
  late final String home;
  late final int type;
  late final int source;
  late final String createdAt;
  late final String updatedAt;
  late final Country2 country;
  late final City city;
  late final Directory directory;

  Address.fromJson(Map<String, dynamic> json){
    id = json['id'];
    personId = json['person_id'];
    countryId = json['country_id'];
    provinceId = json['province_id'];
    directorateId = json['directorate_id'];
    neighborhood = json['neighborhood'];
    street = json['street'];
    home = json['home'];
    type = json['type'];
    source = json['source'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = Country2.fromJson(json['country']);
    city = City.fromJson(json['city']);
    directory = Directory.fromJson(json['directory']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['person_id'] = personId;
    _data['country_id'] = countryId;
    _data['province_id'] = provinceId;
    _data['directorate_id'] = directorateId;
    _data['neighborhood'] = neighborhood;
    _data['street'] = street;
    _data['home'] = home;
    _data['type'] = type;
    _data['source'] = source;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['country'] = country.toJson();
    _data['city'] = city.toJson();
    _data['directory'] = directory.toJson();
    return _data;
  }
}

class Country2 {
  Country2({
    required this.id,
    required this.name,
    required this.nationality,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String nationality;
  late final String createdAt;
  late final String updatedAt;

  Country2.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    nationality = json['nationality'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nationality'] = nationality;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int countryId;
  late final String createdAt;
  late final String updatedAt;

  City.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country_id'] = countryId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
//
class Directory {
  Directory({
    required this.id,
    required this.name,
    required this.provinceId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final int provinceId;
  late final String createdAt;
  late final String updatedAt;

  Directory.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    provinceId = json['province_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['province_id'] = provinceId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Family {
  Family({
    required this.id,
    required this.requestStatus,
    this.requestResult,
    required this.requestDate,
    required this.nationalIdentity,
    required this.branchId,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    this.userId,
    this.person,
  });
  late final int id;
  late final String requestStatus;
  late final Null requestResult;
  late final String requestDate;
  late final int nationalIdentity;
  late final int branchId;
  late final Null image;
  late final String createdAt;
  late final String updatedAt;
  late final Null userId;
  late final Null person;

  Family.fromJson(Map<String, dynamic> json){
    id = json['id'];
    requestStatus = json['request_status'];
    requestResult = null;
    requestDate = json['request_date'];
    nationalIdentity = json['national_identity'];
    branchId = json['branch_id'];
    image = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = null;
    person = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['request_status'] = requestStatus;
    _data['request_result'] = requestResult;
    _data['request_date'] = requestDate;
    _data['national_identity'] = nationalIdentity;
    _data['branch_id'] = branchId;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user_id'] = userId;
    _data['person'] = person;
    return _data;
  }
}