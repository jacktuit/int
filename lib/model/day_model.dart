class DaysModel {
  String? month;
  int? year;
  List<Days>? days;

  DaysModel({this.month, this.year, this.days});

  DaysModel.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    year = json['year'];
    if (json['days'] != null) {
      days = <Days>[];
      json['days'].forEach((v) {
        days!.add(new Days.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['year'] = this.year;
    if (this.days != null) {
      data['days'] = this.days!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Days {
  int? day;
  int? type;

  Days({this.day, this.type});

  Days.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['type'] = this.type;
    return data;
  }
}