import 'dart:convert';

String invoiceDetailToJson(InvoiceDetail data) => json.encode(data.toJson());

class InvoiceDetail {
  int? maCTHDSuaXe;
  int? maHoaDon;
  String? maSoHoaDon;
  int? sTT;
  int? maPhuTung;
  String? maSoPhuTung;
  String? chiTietSua;
  int? soLuong;
  double? donGia;
  double? phanTramGiam;
  double? thanhTien;
  String? ghiChu;
  bool? loai;

  InvoiceDetail(
      {this.maCTHDSuaXe,
      this.maHoaDon,
      this.maSoHoaDon,
      this.sTT,
      this.maPhuTung,
      this.maSoPhuTung,
      this.chiTietSua,
      this.soLuong,
      this.donGia,
      this.phanTramGiam,
      this.thanhTien,
      this.ghiChu,
      this.loai});

  InvoiceDetail.fromJson(Map<String, dynamic> json) {
    maCTHDSuaXe = json['MaCTHDSuaXe'];
    maHoaDon = json['MaHoaDon'];
    maSoHoaDon = json['MaSoHoaDon'];
    sTT = json['STT'];
    maPhuTung = json['MaPhuTung'];
    maSoPhuTung = json['MaSoPhuTung'];
    chiTietSua = json['ChiTietSua'];
    soLuong = json['SoLuong'];
    donGia = json['DonGia'];
    phanTramGiam = json['PhanTramGiam'];
    thanhTien = json['ThanhTien'];
    ghiChu = json['GhiChu'];
    loai = json['Loai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    //data['MaCTHDSuaXe'] = maCTHDSuaXe;
    data['MaHoaDon'] = maHoaDon;
    data['MaSoHoaDon'] = maSoHoaDon;
    data['STT'] = sTT;
    data['MaPhuTung'] = maPhuTung;
    data['MaSoPhuTung'] = maSoPhuTung;
    data['ChiTietSua'] = chiTietSua;
    data['SoLuong'] = soLuong;
    data['DonGia'] = donGia;
    data['PhanTramGiam'] = phanTramGiam;
    data['ThanhTien'] = thanhTien;
    data['GhiChu'] = ghiChu;
    //data['Loai'] = loai;
    return data;
  }
}
