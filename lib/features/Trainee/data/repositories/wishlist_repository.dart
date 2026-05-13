import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:lms_mobileapp/features/Trainee/domain/entities/student_course.dart';

class WishlistRepository {
  WishlistRepository();

  static const String _boxName = 'wishlist_box';
  static const String _key = 'wishlist_courses';

  static Future<Box<dynamic>> _openBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<dynamic>(_boxName);
    }
    return Hive.openBox<dynamic>(_boxName);
  }

  Future<List<StudentCourse>> getWishlistCourses() async {
    final box = await _openBox();
    final rawList = (box.get(_key, defaultValue: <String>[]) as List).cast<String>();
    return rawList
        .map((item) => _fromMap(jsonDecode(item) as Map<String, dynamic>))
        .toList(growable: false);
  }

  Future<void> toggle(StudentCourse course) async {
    final courses = (await getWishlistCourses()).toList();
    final existingIndex = courses.indexWhere((item) => item.id == course.id);

    if (existingIndex >= 0) {
      courses.removeAt(existingIndex);
    } else {
      courses.add(course);
    }

    await _save(courses);
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.put(_key, <String>[]);
  }

  Future<void> _save(List<StudentCourse> courses) async {
    final box = await _openBox();
    final rawList = courses.map((course) => jsonEncode(_toMap(course))).toList(growable: false);
    await box.put(_key, rawList);
  }

  Map<String, dynamic> _toMap(StudentCourse course) => {
        'id': course.id,
        'title': course.title,
        'subtitle': course.subtitle,
        'instructor': course.instructor,
        'category': course.category,
        'progressLabel': course.progressLabel,
        'progress': course.progress,
        'price': course.price,
        'rating': course.rating,
        'reviewCount': course.reviewCount,
        'imageUrl': course.imageUrl,
        'isFree': course.isFree,
      };

  StudentCourse _fromMap(Map<String, dynamic> map) => StudentCourse(
        id: map['id'] as String,
        title: map['title'] as String,
        subtitle: map['subtitle'] as String,
        instructor: map['instructor'] as String,
        category: map['category'] as String,
        progressLabel: map['progressLabel'] as String,
        progress: (map['progress'] as num).toDouble(),
        price: map['price'] as String,
        rating: ((map['rating'] as num?) ?? 4.8).toDouble(),
        reviewCount: (map['reviewCount'] as num?)?.toInt() ?? 120,
        imageUrl: map['imageUrl'] as String,
        isFree: (map['isFree'] as bool?) ?? false,
      );
}
