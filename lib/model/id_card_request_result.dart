class IdCardRequestResult {
  IdCardRequestResult({
    required this.code,
    required this.message,
    required this.data,
  });
  late final int code;
  late final String message;
  late final Data data;

  IdCardRequestResult.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.barcode,
    required this.personId,
    required this.requestDate,
    required this.requestStatus,
    required this.requestResult,
    required this.branchId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String barcode;
  late final int personId;
  late final String requestDate;
  late final String requestStatus;
  late final String requestResult;
  late final String branchId;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  Data.fromJson(Map<String, dynamic> json){
    barcode = json['barcode'];
    personId = json['person_id'];
    requestDate = json['request_date'];
    requestStatus = json['request_status'];
    requestResult = json['request_result'];
    branchId = json['branch_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['barcode'] = barcode;
    _data['person_id'] = personId;
    _data['request_date'] = requestDate;
    _data['request_status'] = requestStatus;
    _data['request_result'] = requestResult;
    _data['branch_id'] = branchId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}