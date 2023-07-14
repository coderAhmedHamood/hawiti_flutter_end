class VerificationRequsetData {
  VerificationRequsetData({
    required this.type,
    required this.provinceBirth,
    required this.countryBirth,
    required this.directorateBirth,
    required this.countryResidence,
    required this.provinceResidence,
    required this.directorateResidence,
    required this.data,
  });
  VerificationRequsetData.empty();
  late final int type;
  late final int checkId;
  late final List<ProvinceBirth> provinceBirth;
  late final List<CountryBirth> countryBirth;
  late final List<DirectorateBirth> directorateBirth;
  late final List<CountryResidence> countryResidence;
  late final List<ProvinceResidence> provinceResidence;
  late final List<DirectorateResidence> directorateResidence;
  late final Data data;

  VerificationRequsetData.fromJson(Map<String, dynamic> json){
    type = json['type'];
    checkId = json['checkId'];
    provinceBirth = List.from(json['province_birth']).map((e)=>ProvinceBirth.fromJson(e)).toList();
    countryBirth = List.from(json['country_birth']).map((e)=>CountryBirth.fromJson(e)).toList();
    directorateBirth = List.from(json['directorate_birth']).map((e)=>DirectorateBirth.fromJson(e)).toList();
    countryResidence = List.from(json['country_residence']).map((e)=>CountryResidence.fromJson(e)).toList();
    provinceResidence = List.from(json['province_residence']).map((e)=>ProvinceResidence.fromJson(e)).toList();
    directorateResidence = List.from(json['directorate_residence']).map((e)=>DirectorateResidence.fromJson(e)).toList();
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['province_birth'] = provinceBirth.map((e)=>e.toJson()).toList();
    _data['country_birth'] = countryBirth.map((e)=>e.toJson()).toList();
    _data['directorate_birth'] = directorateBirth.map((e)=>e.toJson()).toList();
    _data['country_residence'] = countryResidence.map((e)=>e.toJson()).toList();
    _data['province_residence'] = provinceResidence.map((e)=>e.toJson()).toList();
    _data['directorate_residence'] = directorateResidence.map((e)=>e.toJson()).toList();
    _data['data'] = data.toJson();
    return _data;
  }
}

class ProvinceBirth {
  ProvinceBirth({
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

  ProvinceBirth.fromJson(Map<String, dynamic> json){
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

class CountryBirth {
  CountryBirth({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String createdAt;
  late final String updatedAt;

  CountryBirth.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class DirectorateBirth {
  DirectorateBirth({
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

  DirectorateBirth.fromJson(Map<String, dynamic> json){
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

class CountryResidence {
  CountryResidence({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String createdAt;
  late final String updatedAt;

  CountryResidence.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class ProvinceResidence {
  ProvinceResidence({
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

  ProvinceResidence.fromJson(Map<String, dynamic> json){
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

class DirectorateResidence {
  DirectorateResidence({
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

  DirectorateResidence.fromJson(Map<String, dynamic> json){
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

class Data {
  Data({
    required this.id,
    required this.requestStatusId,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.grandFatherName,
    required this.grandMotherName,
    required this.nickName,
    required this.fatherNickName,
    required this.motherNickName,
    required this.fatherThirdName,
    required this.motherThirdName,
    required this.nationalityId,
    required this.fatherNationalityId,
    required this.motherNationalityId,
    required this.gender,
    required this.dateOfBirth,
    this.dateOfBirthHijri,
    required this.countryBirthId,
    required this.provinceBirthId,
    required this.directorateBirthId,
    required this.villageBirth,
    required this.maritalStatus,
    required this.bloodTypeId,
    required this.educationStatus,
    this.educationLevel,
    required this.countryResidenceId,
    required this.provinceResidenceId,
    required this.directorateResidenceId,
    this.villageResidence,
    this.street,
    this.home,
    required this.Religion,
    this.specilaization,
    required this.occupation,
    required this.phone,
    required this.imagePath,
    this.Employer,
    required this.requestDate,
    this.resultRequest,
    this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int requestStatusId;
  late final String name;
  late final String fatherName;
  late final String motherName;
  late final String grandFatherName;
  late final String grandMotherName;
  late final String nickName;
  late final String fatherNickName;
  late final String motherNickName;
  late final String fatherThirdName;
  late final String motherThirdName;
  late final int nationalityId;
  late final int fatherNationalityId;
  late final int motherNationalityId;
  late final int gender;
  late final String dateOfBirth;
  late final Null dateOfBirthHijri;
  late final int countryBirthId;
  late final int provinceBirthId;
  late final int directorateBirthId;
  late final String villageBirth;
  late final String maritalStatus;
  late final String bloodTypeId;
  late final String educationStatus;
  late final Null educationLevel;
  late final int countryResidenceId;
  late final int provinceResidenceId;
  late final int directorateResidenceId;
  late final Null villageResidence;
  late final Null street;
  late final Null home;
  late final String Religion;
  late final Null specilaization;
  late final String occupation;
  late final String phone;
  late final String imagePath;
  late final Null Employer;
  late final String requestDate;
  late final Null resultRequest;
  late final Null userId;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    requestStatusId = json['request_status_id'];
    name = json['name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    grandFatherName = json['grand_father_name'];
    grandMotherName = json['grand_mother_name'];
    nickName = json['nick_name'];
    fatherNickName = json['father_nick_name'];
    motherNickName = json['mother_nick_name'];
    fatherThirdName = json['father_third_name'];
    motherThirdName = json['mother_third_name'];
    nationalityId = json['nationality_id'];
    fatherNationalityId = json['father_nationality_id'];
    motherNationalityId = json['mother_nationality_id'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    dateOfBirthHijri = null;
    countryBirthId = json['country_birth_id'];
    provinceBirthId = json['province_birth_id'];
    directorateBirthId = json['directorate_birth_id'];
    villageBirth = json['village_birth'];
    maritalStatus = json['marital_status'];
    bloodTypeId = json['blood_type_id'];
    educationStatus = json['education_status'];
    educationLevel = null;
    countryResidenceId = json['country_residence_id'];
    provinceResidenceId = json['province_residence_id'];
    directorateResidenceId = json['directorate_residence_id'];
    villageResidence = null;
    street = null;
    home = null;
    Religion = json['Religion'];
    specilaization = null;
    occupation = json['occupation'];
    phone = json['phone'];
    imagePath = json['image_path'];
    Employer = null;
    requestDate = json['request_date'];
    resultRequest = null;
    userId = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['request_status_id'] = requestStatusId;
    _data['name'] = name;
    _data['father_name'] = fatherName;
    _data['mother_name'] = motherName;
    _data['grand_father_name'] = grandFatherName;
    _data['grand_mother_name'] = grandMotherName;
    _data['nick_name'] = nickName;
    _data['father_nick_name'] = fatherNickName;
    _data['mother_nick_name'] = motherNickName;
    _data['father_third_name'] = fatherThirdName;
    _data['mother_third_name'] = motherThirdName;
    _data['nationality_id'] = nationalityId;
    _data['father_nationality_id'] = fatherNationalityId;
    _data['mother_nationality_id'] = motherNationalityId;
    _data['gender'] = gender;
    _data['date_of_birth'] = dateOfBirth;
    _data['date_of_birth_hijri'] = dateOfBirthHijri;
    _data['country_birth_id'] = countryBirthId;
    _data['province_birth_id'] = provinceBirthId;
    _data['directorate_birth_id'] = directorateBirthId;
    _data['village_birth'] = villageBirth;
    _data['marital_status'] = maritalStatus;
    _data['blood_type_id'] = bloodTypeId;
    _data['education_status'] = educationStatus;
    _data['education_level'] = educationLevel;
    _data['country_residence_id'] = countryResidenceId;
    _data['province_residence_id'] = provinceResidenceId;
    _data['directorate_residence_id'] = directorateResidenceId;
    _data['village_residence'] = villageResidence;
    _data['street'] = street;
    _data['home'] = home;
    _data['Religion'] = Religion;
    _data['specilaization'] = specilaization;
    _data['occupation'] = occupation;
    _data['phone'] = phone;
    _data['image_path'] = imagePath;
    _data['Employer'] = Employer;
    _data['request_date'] = requestDate;
    _data['result_request'] = resultRequest;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}