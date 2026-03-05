/// Model representing a single activity within a destination
class Activity {
  final String id;
  final String name;
  bool isCompleted;

  Activity({
    required this.id,
    required this.name,
    this.isCompleted = false,
  });

  /// Create a copy with modified fields
  Activity copyWith({
    String? id,
    String? name,
    bool? isCompleted,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() => 'Activity(id: $id, name: $name, isCompleted: $isCompleted)';
}
