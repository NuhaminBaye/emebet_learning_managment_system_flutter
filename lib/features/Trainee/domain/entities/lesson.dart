import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String id;
  final String title;
  final String moduleName;
  final String videoUrl;
  final String thumbnailUrl;
  final String duration;
  final String currentTime;
  final String description;
  final List<String> objectives;
  final List<String> resources;

  const Lesson({
    required this.id,
    required this.title,
    required this.moduleName,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.duration,
    required this.currentTime,
    required this.description,
    required this.objectives,
    required this.resources,
  });

  @override
  List<Object?> get props => [id, title, moduleName];
}