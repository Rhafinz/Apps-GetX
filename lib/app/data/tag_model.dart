class Tag {
  bool? success;
  String? message;
  List<DataTag>? data;

  Tag({this.success, this.message, this.data});

  Tag.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataTag>[];
      json['data'].forEach((v) {
        data!.add(new DataTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataTag {
  int? id;
  String? namaTag;
  String? slug;
  String? createdAt;
  String? updatedAt;

  DataTag({this.id, this.namaTag, this.slug, this.createdAt, this.updatedAt});

  DataTag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaTag = json['nama_tag'];
    slug = json['slug'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_tag'] = this.namaTag;
    data['slug'] = this.slug;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
