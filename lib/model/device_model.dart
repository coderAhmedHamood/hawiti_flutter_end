import 'package:uuid/uuid.dart';

class DeviceModel {
 late String name;
 late  String uuid;
 late  String pushToken;
 late String platform;
 late String platformVersion;
late  String version;
  String? lastSeen;
  String? latitude;
  String? longitude;
 DeviceModel.empty();
  DeviceModel(
      {
        required this.name,
        required this.uuid,
        required this.pushToken,
        required this.platform,
        required this.platformVersion,
        required this.version,
        this.lastSeen,
        this.latitude,
        this.longitude});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
    pushToken = json['token'];
    platform = json['platform'];
    platformVersion = json['platform_version'];
    version = json['version'];
    lastSeen = json['last_seen'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['uuid'] = this.uuid;
    data['push_token'] = this.pushToken;
    data['platform'] = this.platform;
    data['platform_version'] = this.platformVersion;
    data['version'] = this.version;
    data['last_seen'] = this.lastSeen;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}