import 'destination.dart';

/// Model representing a trip with multiple destinations
class Trip {
  final String id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final List<Destination> destinations;

  Trip({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.destinations = const [],
  });

  /// Create a copy with modified fields
  Trip copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    List<Destination>? destinations,
  }) {
    return Trip(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      destinations: destinations ?? this.destinations,
    );
  }

  /// Calculate overall trip completion percentage
  double get completionPercentage {
    if (destinations.isEmpty) return 0.0;
    final totalActivities = destinations.fold<int>(
      0,
      (sum, dest) => sum + dest.activities.length,
    );
    if (totalActivities == 0) return 0.0;
    final completedActivities = destinations.fold<int>(
      0,
      (sum, dest) =>
          sum + dest.activities.where((a) => a.isCompleted).length,
    );
    return completedActivities / totalActivities;
  }

  /// Get trip duration in days
  int get durationInDays => endDate.difference(startDate).inDays + 1;

  @override
  String toString() => 'Trip(id: $id, name: $name, destinations: ${destinations.length})';
}
