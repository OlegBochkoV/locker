class Locker {
  int? id;
  String? code;
  String? title;
  bool? isLock;

  Locker({
    this.id,
    this.code,
    this.title,
    this.isLock,
  });

  Locker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    title = json['title'];
    isLock = json['is_lock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['title'] = title;
    data['is_lock'] = isLock;
    return data;
  }
}
