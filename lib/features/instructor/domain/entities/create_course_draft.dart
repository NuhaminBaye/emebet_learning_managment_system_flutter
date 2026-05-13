import 'package:equatable/equatable.dart';

class CreateCourseDraft extends Equatable {
  final String title;
  final String description;
  final String? disciplineId;
  final String proficiency; // Beginner | Intermediate | Advanced
  final String priceUsd;
  final String? thumbnailPath;

  const CreateCourseDraft({
    this.title = '',
    this.description = '',
    this.disciplineId,
    this.proficiency = 'Beginner',
    this.priceUsd = '0.00',
    this.thumbnailPath,
  });

  CreateCourseDraft copyWith({
    String? title,
    String? description,
    String? disciplineId,
    String? proficiency,
    String? priceUsd,
    String? thumbnailPath,
  }) {
    return CreateCourseDraft(
      title: title ?? this.title,
      description: description ?? this.description,
      disciplineId: disciplineId ?? this.disciplineId,
      proficiency: proficiency ?? this.proficiency,
      priceUsd: priceUsd ?? this.priceUsd,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }

  @override
  List<Object?> get props =>
      [title, description, disciplineId, proficiency, priceUsd, thumbnailPath];
}
