class RequestVerifyDataModel {
  RequestVerifyDataModel({
    required this.id,
    required this.barcode,
    required this.personId,
    required this.requestDate,
    required this.requestStatus,
    required this.requestResult,
    required this.branchId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.person,
    required this.verification,
    required this.attached,
  });
  late final int id;
  late final String barcode;
  late final int personId;
  late final String requestDate;
  late final String requestStatus;
  late final String requestResult;
  late final int branchId;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;
  late final Person person;
  late final List<Verification> verification;
  late final List<Attached> attached;
  RequestVerifyDataModel.empty();
  RequestVerifyDataModel.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    barcode = json['barcode']??"";
    personId = json['person_id']??0;
    requestDate = json['request_date']??"";
    requestStatus = json['request_status']??"";
    requestResult = json['request_result']??"";
    branchId = json['branch_id']??0;
    userId = json['user_id']??0;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    person = Person.fromJson(json['person']);
    // verification = List.from(json['verification']).map((e)=>Verification.fromJson(e)).toList();
    // attached = List.from(json['attached']).map((e)=>Attached.fromJson(e)).toList();
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
    _data['verification'] = verification.map((e)=>e.toJson()).toList();
    _data['attached'] = attached.map((e)=>e.toJson()).toList();
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
    required this.bloodType,
    required this.educationStatus,
    required this.educationLevel,
    required this.religion,
    required this.specilaization,
    required this.phone,
    required this.imagePath,
    required this.employer,
    required this.requestDate,
    required this.resultRequest,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
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
  late final String bloodType;
  late final String educationStatus;
  late final String educationLevel;
  late final String religion;
  late final String specilaization;
  late final String phone;
  late final String imagePath;
  late final String employer;
  late final String requestDate;
  late final String resultRequest;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;
  late final List<Address> address;

  Person.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    requestStatus = json['request_status']??"";
    firstName = json['first_name']??"";
    secondName = json['second_name']??"";
    thirdName = json['third_name']??"";
    fourthName = json['fourth_name']??"";
    nickName = json['nick_name']??"";
    nationality = json['nationality']??"";
    motherNationality = json['mother_nationality']??"";
    fatherNationality = json['father_nationality']??"";
    motherFullName = json['mother_full_name']??"";
    gender = json['gender']??0;
    dateOfBirth = json['date_of_birth']??"";
    maritalStatus = json['marital_status']??"";
    bloodType = json['blood_type']??"";
    educationStatus = json['education_status']??"";
    educationLevel = json['education_level']??"";
    religion = json['religion']??"";
    specilaization = json['specilaization']??"";
    phone = json['phone']??"";
    imagePath = json['image_path']??"";
    employer = json['employer']??"";
    requestDate = json['request_date']??"";
    resultRequest = json['result_request']??"";
    userId = json['user_id']??0;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
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
  late final Country country;
  late final City city;
  late final Directory directory;

  Address.fromJson(Map<String, dynamic> json){
    id = json['id'];
    personId = json['person_id']??0;
    countryId = json['country_id']??0;
    provinceId = json['province_id']??0;
    directorateId = json['directorate_id']??0;
    neighborhood = json['neighborhood']??"";
    street = json['street']??"";
    home = json['home']??"";
    type = json['type']??"";
    source = json['source']??0;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    country = Country.fromJson(json['country']);
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

class Country {
  Country({
    required this.id,
    required this.name,
    required this.nationality,
  });
  late final int id;
  late final String name;
  late final String nationality;

  Country.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name']??"";
    nationality = json['nationality']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nationality'] = nationality;
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  City.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Directory {
  Directory({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;

  Directory.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Verification {
  Verification({
    required this.id,
    required this.personId,
    required this.requestId,
    required this.code,
    required this.typeRequest,
    required this.status,
    required this.authorType,
    this.imageFront,
    this.imageBack,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.idCard,
  });
  late final int id;
  late final int personId;
  late final int requestId;
  late final int code;
  late final int typeRequest;
  late final int status;
  late final String authorType;
  late final String? imageFront;
  late final String? imageBack;
  late final String createdAt;
  late final String updatedAt;
  late final int userId;
  late final IdCard idCard;

  Verification.fromJson(Map<String, dynamic> json){
    id = json['id'];
    personId = json['person_id']??0;
    requestId = json['request_id']??0;
    code = json['code']??0;
    typeRequest = json['type_request']??0;
    status = json['status']??0;
    authorType = json['author_type']??"";
    imageFront = null;
    imageBack = null;
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    userId = json['user_id']??0;
    if(json['id_card']!=null){
      idCard = IdCard.fromJson(json['id_card']);
    }

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['person_id'] = personId;
    _data['request_id'] = requestId;
    _data['code'] = code;
    _data['type_request'] = typeRequest;
    _data['status'] = status;
    _data['author_type'] = authorType;
    _data['image_front'] = imageFront;
    _data['image_back'] = imageBack;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user_id'] = userId;
    _data['id_card'] = idCard.toJson();
    return _data;
  }
}

class IdCard {
  IdCard({
    required this.id,
    required this.personId,
    required this.nationalIdentity,
    required this.branchId,
    required this.issuingParty,
    required this.releaseDate,
    required this.expiryDate,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.person,
  });
  late final int id;
  late final int personId;
  late final int nationalIdentity;
  late final int branchId;
  late final String issuingParty;
  late final String releaseDate;
  late final String expiryDate;
  late final String image;
  late final String createdAt;
  late final String updatedAt;
  late final int userId;
  late final Person person;

  IdCard.fromJson(Map<String, dynamic> json){
    id = json['id'];
    personId = json['person_id'];
    nationalIdentity = json['national_identity'];
    branchId = json['branch_id'];
    issuingParty = json['issuing_party'];
    releaseDate = json['release_date'];
    expiryDate = json['expiry_date'];
    image = json['image']??"";
    createdAt = json['created_at']??"";
    updatedAt = json['updated_at']??"";
    userId = json['user_id']??0;
    person = Person.fromJson(json['person']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['person_id'] = personId;
    _data['national_identity'] = nationalIdentity;
    _data['branch_id'] = branchId;
    _data['issuing_party'] = issuingParty;
    _data['release_date'] = releaseDate;
    _data['expiry_date'] = expiryDate;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user_id'] = userId;
    _data['person'] = person.toJson();
    return _data;
  }
}

class Attached {
  Attached({
    required this.id,
    required this.requestId,
    required this.requestType,
    required this.fileType,
    required this.fileName,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });
  late final int id;
  late final int requestId;
  late final int requestType;
  late final int fileType;
  late final String fileName;
  late final String createdAt;
  late final String updatedAt;
  late final int userId;

  Attached.fromJson(Map<String, dynamic> json){
    id = json['id'];
    requestId = json['request_id'];
    requestType = json['request_type'];
    fileType = json['file_type'];
    fileName = json['file_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['request_id'] = requestId;
    _data['request_type'] = requestType;
    _data['file_type'] = fileType;
    _data['file_name'] = fileName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['user_id'] = userId;
    return _data;
  }
}