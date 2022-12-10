class Data {
  final String tamExp, eng, engExp;
  Data(this.tamExp, this.eng, this.engExp);

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(json['tam_exp'], json['eng'], json['eng_exp']);
  }
}
