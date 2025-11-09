class PlaceInfo {
  String? name;
  String? time;

  PlaceInfo({this.name, this.time});

  PlaceInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    return data;
  }
}
