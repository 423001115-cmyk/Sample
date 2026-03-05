import 'activity.dart';

/// Model representing a destination within a trip
class Destination {
  final String id;
  final String name;
  final String location;
  final String notes;
  final List<Activity> activities;

  Destination({
    required this.id,
    required this.name,
    required this.location,
    this.notes = '',
    this.activities = const [],
  });

  /// Create a copy with modified fields
  Destination copyWith({
    String? id,
    String? name,
    String? location,
    String? notes,
    List<Activity>? activities,
  }) {
    return Destination(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      activities: activities ?? this.activities,
    );
  }

  /// Calculate completion percentage
  double get completionPercentage {
    if (activities.isEmpty) return 0.0;
    final completed = activities.where((a) => a.isCompleted).length;
    return completed / activities.length;
  }

  @override
  String toString() => 'Destination(id: $id, name: $name, location: $location)';
}
