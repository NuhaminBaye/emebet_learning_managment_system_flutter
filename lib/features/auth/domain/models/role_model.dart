import 'package:hive/hive.dart';

part 'role_model.g.dart';

@HiveType(typeId: 12)
class RoleModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String key;

  @HiveField(3)
  final bool isProtected;

  RoleModel({
    required this.id,
    required this.name,
    required this.key,
    this.isProtected = false,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? '',
      key: json['key'] ?? '',
      isProtected: json['protected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'key': key,
      'protected': isProtected,
    };
  }
}