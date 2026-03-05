import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';

/// Provider for managing all trip-related state and logic
class TripProvider extends ChangeNotifier {
  final List<Trip> _trips = [];

  TripProvider();

  /// Get all trips
  List<Trip> get trips => _trips;

  /// Add a new trip
  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  /// Delete a trip by ID
  void deleteTrip(String tripId) {
    _trips.removeWhere((trip) => trip.id == tripId);
    notifyListeners();
  }

  /// Update a trip
  void updateTrip(Trip updatedTrip) {
    final index = _trips.indexWhere((trip) => trip.id == updatedTrip.id);
    if (index != -1) {
      _trips[index] = updatedTrip;
      notifyListeners();
    }
  }

  /// Get a trip by ID
  Trip? getTripById(String tripId) {
    try {
      return _trips.firstWhere((trip) => trip.id == tripId);
    } catch (e) {
      return null;
    }
  }

  /// Add a destination to a trip
  void addDestination(String tripId, Destination destination) {
    final trip = getTripById(tripId);
    if (trip != null) {
      final updatedDestinations = [...trip.destinations, destination];
      updateTrip(trip.copyWith(destinations: updatedDestinations));
    }
  }

  /// Delete a destination from a trip
  void deleteDestination(String tripId, String destinationId) {
    final trip = getTripById(tripId);
    if (trip != null) {
      final updatedDestinations = trip.destinations
          .where((dest) => dest.id != destinationId)
          .toList();
      updateTrip(trip.copyWith(destinations: updatedDestinations));
    }
  }

  /// Update a destination in a trip
  void updateDestination(String tripId, Destination updatedDestination) {
    final trip = getTripById(tripId);
    if (trip != null) {
      final updatedDestinations = trip.destinations.map((dest) {
        return dest.id == updatedDestination.id ? updatedDestination : dest;
      }).toList();
      updateTrip(trip.copyWith(destinations: updatedDestinations));
    }
  }

  /// Add an activity to a destination
  void addActivity(String tripId, String destinationId, Activity activity) {
    final trip = getTripById(tripId);
    if (trip != null) {
      final updatedDestinations = trip.destinations.map((dest) {
        if (dest.id == destinationId) {
          return dest.copyWith(activities: [...dest.activities, activity]);
        }
        return dest;
      }).toList();
      updateTrip(trip.copyWith(destinations: updatedDestinations));
    }
  }

  /// Delete an activity from a destination
  void deleteActivity(
    String tripId,
    String destinationId,
    String activityId,
  ) {
    final trip = getTripById(tripId);
    if (trip != null) {
      final updatedDestinations = trip.destinations.map((dest) {
        if (dest.id == destinationId) {
          final updatedActivities =
              dest.activities.where((act) => act.id != activityId).toList();
          return dest.copyWith(activities: updatedActivities);
        }
        return dest;
      }).toList();
      updateTrip(trip.copyWith(destinations: updatedDestinations));
    }
  }

  /// Toggle activity completion
  void toggleActivityCompletion(
    String tripId,
    String destinationId,
    String activityId,
  ) {
    final trip = getTripById(tripId);
    if (trip != null) {
      final updatedDestinations = trip.destinations.map((dest) {
        if (dest.id == destinationId) {
          final updatedActivities = dest.activities.map((act) {
            if (act.id == activityId) {
              return act.copyWith(isCompleted: !act.isCompleted);
            }
            return act;
          }).toList();
          return dest.copyWith(activities: updatedActivities);
        }
        return dest;
      }).toList();
      updateTrip(trip.copyWith(destinations: updatedDestinations));
    }
  }

  /// Calculate overall completion for a trip
  double getTripCompletion(String tripId) {
    final trip = getTripById(tripId);
    return trip?.completionPercentage ?? 0.0;
  }

  /// Clear all trips (for testing/reset)
  void clearAllTrips() {
    _trips.clear();
    notifyListeners();
  }
}
