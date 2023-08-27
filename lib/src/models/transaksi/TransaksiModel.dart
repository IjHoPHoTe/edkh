import 'dart:convert';

Transaksi transaksiModelFromJson(String str) =>
    Transaksi.fromJson(json.decode(str));

String transaksiModelToJson(Transaksi data) => json.encode(data.toJson());

class Transaksi {
  int? code;
  String? message;
  List<TransaksiData>? data;

  Transaksi({this.code, this.message, this.data});

  Transaksi.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TransaksiData>[];
      json['data'].forEach((v) {
        data!.add(new TransaksiData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TransaksiData {
  int? id;
  String? jenis;
  String? kegiatan;
  String? jumlah;
  String? keterangan;
  String? createdAt;
  String? updatedAt;
  Users? users;

  TransaksiData(
      {this.id,
      this.jenis,
      this.kegiatan,
      this.jumlah,
      this.keterangan,
      this.createdAt,
      this.updatedAt,
      this.users});

  TransaksiData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    jenis = json['jenis'];
    kegiatan = json['kegiatan'];
    jumlah = json['jumlah'];
    keterangan = json['keterangan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['jenis'] = this.jenis;
    data['kegiatan'] = this.kegiatan;
    data['jumlah'] = this.jumlah;
    data['keterangan'] = this.keterangan;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  Users({this.id, this.name, this.email, this.createdAt, this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
