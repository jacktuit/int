class ColorModel {
  int? type;
  String? color;

  ColorModel({this.type, this.color});

  ColorModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['color'] = this.color;
    return data;
  }
}
