import 'package:hive/hive.dart';
import 'role_model.dart';

part 'user_model.g.dart';

@HiveType(typeId: 11)
class UserModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? phoneNumber;

  @HiveField(4)
  final String? avatarUrl;

  @HiveField(5)
  final bool isActive;

  @HiveField(6)
  final List<RoleModel>? roles;

  @HiveField(7)
  final RoleModel? currentRole;

  @HiveField(8)
  final DateTime? createdAt;

  @HiveField(9)
  final DateTime? updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.avatarUrl,
    this.isActive = true,
    this.roles,
    this.currentRole,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ??
          json['_id']?.toString() ??
          '',
      name: json['name'] ??
          json['full_name'] ??
          '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] as String?,
      avatarUrl: json['avatar'] ??
          json['avatarUrl'],
      isActive: json['isActive'] ?? true,
      roles: json['roles'] != null
          ? (json['roles'] as List)
              .map((e) => RoleModel.fromJson(e))
              .toList()
          : null,
      currentRole: json['currentRole'] != null
          ? RoleModel.fromJson(json['currentRole'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatar': avatarUrl,
      'isActive': isActive,
      'roles': roles?.map((e) => e.toJson()).toList(),
      'currentRole': currentRole?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? avatarUrl,
    bool? isActive,
    List<RoleModel>? roles,
    RoleModel? currentRole,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isActive: isActive ?? this.isActive,
      roles: roles ?? this.roles,
      currentRole: currentRole ?? this.currentRole,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}