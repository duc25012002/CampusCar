import 'dart:convert';

Accessary accessaryFromJson(String str) => Accessary.fromJson(json.decode(str));

// phụ tùng model
class Accessary {
  int? code;
  String? message;
  Data? data;

  Accessary({this.code, this.message, this.data});

  Accessary.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Records>? records;

  Data({this.records});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  int? maPhuTung;
  String? maSoPhuTung;
  String? tenPhuTung;
  int? maModel;
  String? tenModel;
  int? soLuong;
  String? donVi;
  double? tongTienVon;
  double? giaVonTren1DV;
  double? giaBanTren1DV;
  String? ghiChu;

  Records(
      {this.maPhuTung,
      this.maSoPhuTung,
      this.tenPhuTung,
      this.maModel,
      this.tenModel,
      this.soLuong,
      this.donVi,
      this.tongTienVon,
      this.giaVonTren1DV,
      this.giaBanTren1DV,
      this.ghiChu});

  Records.fromJson(Map<String, dynamic> json) {
    maPhuTung = json['MaPhuTung'];
    maSoPhuTung = json['MaSoPhuTung'];
    tenPhuTung = json['TenPhuTung'];
    maModel = json['MaModel'];
    tenModel = json['TenModel'];
    soLuong = json['SoLuong'];
    donVi = json['DonVi'];
    tongTienVon = json['TongTienVon'];
    giaVonTren1DV = json['GiaVonTren1DV'];
    giaBanTren1DV = json['GiaBanTren1DV'];
    ghiChu = json['GhiChu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MaPhuTung'] = maPhuTung;
    data['MaSoPhuTung'] = maSoPhuTung;
    data['TenPhuTung'] = tenPhuTung;
    data['MaModel'] = maModel;
    data['TenModel'] = tenModel;
    data['SoLuong'] = soLuong;
    data['DonVi'] = donVi;
    data['TongTienVon'] = tongTienVon;
    data['GiaVonTren1DV'] = giaVonTren1DV;
    data['GiaBanTren1DV'] = giaBanTren1DV;
    data['GhiChu'] = ghiChu;
    return data;
  }

  @override
  String toString() {
    return "MaPhuTung: $maPhuTung   TenPhuTung: $tenPhuTung\n";
  }
}
