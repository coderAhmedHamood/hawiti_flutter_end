class Person {
  late int id;
  late int requestStatusId;
  late String name;
  late String fatherName;
  late String motherName;
  late String grandFatherName;
  late String grandMotherName;
  late String nickName;
  late String fatherNickName;
  late String motherNickName;
  late String? fatherThirdName;
  late String? motherThirdName;
  late int nationalityId;
  late int fatherNationalityId;
  late int motherNationalityId;
  late int gender;
  late String dateOfBirth;
  late String? dateOfBirthHijri;
  late int countryBirthId;
  late int provinceBirthId;
  late int directorateBirthId;
  late String villageBirth;
  late String maritalStatus;
  late int bloodTypeId;
  late String educationStatus;
  late String educationLevel;
  late int countryResidenceId;
  late int provinceResidenceId;
  late int directorateResidenceId;
  late String villageResidence;
  late String street;
  late String home;
  late String religion;
  late String specialization;
  late String occupation;
  late String phone;
  late String? imagePath;
  late String employer;
  late String requestDate;
  late String resultRequest;
  late DateTime createdAt;
  late DateTime updatedAt;

  Person({
    this.id = 0,
    this.requestStatusId = 0,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.grandFatherName,
    required this.grandMotherName,
    required this.nickName,
    required this.fatherNickName,
    required this.motherNickName,
    required this.nationalityId,
    required this.fatherNationalityId,
    required this.motherNationalityId,
    required this.gender,
    required this.dateOfBirth,
    required this.countryBirthId,
    required this.provinceBirthId,
    required this.directorateBirthId,
    required this.villageBirth,
    required this.maritalStatus,
    required this.bloodTypeId,
    required this.educationStatus,
    required this.educationLevel,
    required this.countryResidenceId,
    required this.provinceResidenceId,
    required this.directorateResidenceId,
    required this.villageResidence,
    required this.street,
    required this.home,
    required this.religion,
    required this.specialization,
    required this.occupation,
    required this.phone,
    required this.employer,
    required this.requestDate,
    required this.resultRequest,
    required this.createdAt,
    required this.updatedAt,
    this.dateOfBirthHijri,
    this.imagePath,
    this.fatherThirdName,
    this.motherThirdName,
  });
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'] as int,
      requestStatusId: json['requestStatusId'] as int,
      name: json['name'] as String,
      fatherName: json['fatherName'] as String,
      motherName: json['motherName'] as String,
      grandFatherName: json['grandFatherName'] as String,
      grandMotherName: json['grandMotherName'] as String,
      nickName: json['nickName'] as String,
      fatherNickName: json['fatherNickName'] as String,
      motherNickName: json['motherNickName'] as String,
      fatherThirdName: json['fatherThirdName'] as String?,
      motherThirdName: json['motherThirdName'] as String?,
      nationalityId: json['nationalityId'] as int,
      fatherNationalityId: json['fatherNationalityId'] as int,
      motherNationalityId: json['motherNationalityId'] as int,
      gender: json['gender'] as int,
      dateOfBirth: json['dateOfBirth'] as String,
      dateOfBirthHijri: json['dateOfBirthHijri'] as String?,
      countryBirthId: json['countryBirthId'] as int,
      provinceBirthId: json['provinceBirthId'] as int,
      directorateBirthId: json['directorateBirthId'] as int,
      villageBirth: json['villageBirth'] as String,
      maritalStatus: json['maritalStatus'] as String,
      bloodTypeId: json['bloodTypeId'] as int,
      educationStatus: json['educationStatus'] as String,
      educationLevel: json['educationLevel'] as String,
      countryResidenceId: json['countryResidenceId'] as int,
      provinceResidenceId: json['provinceResidenceId'] as int,
      directorateResidenceId: json['directorateResidenceId'] as int,
      villageResidence: json['villageResidence'] as String,
      street: json['street'] as String,
      home: json['home'] as String,
      religion: json['religion'] as String,
      specialization: json['specialization'] as String,
      occupation: json['occupation'] as String,
      phone: json['phone'] as String,
      employer: json['employer'] as String,
      requestDate: json['requestDate'] as String,
      resultRequest: json['resultRequest'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      imagePath: json['imagePath'] as String?,
    );

  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'requestStatusId': requestStatusId,
      'name': name,
      'fatherName': fatherName,
      'motherName': motherName,
      'grandFatherName': grandFatherName,
      'grandMotherName': grandMotherName,
      'nickName': nickName,
      'fatherNickName': fatherNickName,
      'motherNickName': motherNickName,
      'fatherThirdName': fatherThirdName,
      'motherThirdName': motherThirdName,
      'nationalityId': nationalityId,
      'fatherNationalityId': fatherNationalityId,
      'motherNationalityId': motherNationalityId,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'dateOfBirthHijri': dateOfBirthHijri,
      'countryBirthId': countryBirthId,
      'provinceBirthId': provinceBirthId,
      'directorateBirthId': directorateBirthId,
      'villageBirth': villageBirth,
      'maritalStatus': maritalStatus,
      'bloodTypeId': bloodTypeId,
      'educationStatus': educationStatus,
      'educationLevel': educationLevel,
      'countryResidenceId': countryResidenceId,
      'provinceResidenceId': provinceResidenceId,
      'directorateResidenceId': directorateResidenceId,
      'villageResidence': villageResidence,
      'street': street,
      'home': home,
      'religion': religion,
      'specialization': specialization,
      'occupation': occupation,
      'phone': phone,
      'imagePath': imagePath,
      'employer': employer,
      'requestDate': requestDate,
      'resultRequest': resultRequest,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

}
