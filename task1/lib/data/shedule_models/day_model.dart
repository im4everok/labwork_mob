class Day {
  late String subject;
  late int para;
  late String position;

  Day.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    para = json['para'];
    position = json['position'];
  }

  static fromJSON(e) {}
}
