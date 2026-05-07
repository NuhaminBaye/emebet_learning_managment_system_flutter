import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class StudentStat extends Equatable {
  final String label;
  final String value;
  final IconData icon;
  final Color background;

  const StudentStat({
    required this.label,
    required this.value,
    required this.icon,
    required this.background,
  });

  @override
  List<Object?> get props => [label, value, icon, background];
}