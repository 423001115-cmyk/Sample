import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';
import 'screens.dart';

/// Screen showing detailed information about a trip
class TripDetailsScreen extends StatelessWidget {
  final String tripId;

  const TripDetailsScreen({Key? key, required this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    final trip = context.watch<TripProvider>().getTripById(tripId);

    if (trip == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Trip Not Found')),
        body: const Center(child: Text('Trip not found')),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Trip Details'),
      ),
      body: GradientBackground(
        isDarkMode: isDarkMode,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 80, 16, 20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      // Trip Header
                      Hero(
                        tag: 'trip-${trip.id}',
                        child: GlassCard(
                          isDarkMode: isDarkMode,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trip.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium,
                              ),
                              const SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: DateFormat('MMM dd')
                                          .format(trip.startDate),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    TextSpan(
                                      text: ' - ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    TextSpan(
                                      text: DateFormat('MMM dd, yyyy')
                                          .format(trip.endDate),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                trip.description,
                                style:
                                    Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 20),
                              AnimatedProgressBar(
                                progress: trip.completionPercentage,
                                height: 8,
                                backgroundColor: isDarkMode
                                    ? Colors.white.withOpacity(0.1)
                                    : Colors.black.withOpacity(0.1),
                                foregroundGradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF1565C0),
                                    Color(0xFF00BFA5),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '${(trip.completionPercentage * 100).toStringAsFixed(0)}% Trip Progress • ${trip.durationInDays} days',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Destinations Section
                      if (trip.destinations.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 8),
                              child: Text(
                                'Destinations',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall,
                              ),
                            ),
                            ...trip.destinations.map((destination) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: DestinationCard(
                                  destination: destination,
                                  tripId: trip.id,
                                  isDarkMode: isDarkMode,
                                ),
                              );
                            }).toList(),
                          ],
                        )
                      else
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.location_off,
                                  size: 64,
                                  color: isDarkMode
                                      ? Colors.white.withOpacity(0.2)
                                      : Colors.black.withOpacity(0.2),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No destinations yet',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      const SizedBox(height: 100), // Bottom padding for button
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GlassCard(
        isDarkMode: isDarkMode,
        borderRadius: 32,
        padding: EdgeInsets.zero,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/add-destination',
              arguments: trip.id,
            );
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color(0xFF1565C0),
                  Color(0xFF00BFA5),
                ],
              ),
            ),
            child: const Icon(Icons.add_location, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// Card displaying a destination with its activities
class DestinationCard extends StatefulWidget {
  final Destination destination;
  final String tripId;
  final bool isDarkMode;

  const DestinationCard({
    Key? key,
    required this.destination,
    required this.tripId,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _expandController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _expandController.forward();
      } else {
        _expandController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      isDarkMode: widget.isDarkMode,
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          GestureDetector(
            onTap: _toggleExpand,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.destination.name,
                          style: Theme.of(context).textTheme.headlineSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 14, color: Color(0xFF00BFA5)),
                            const SizedBox(width: 4),
                            Text(
                              widget.destination.location,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: _isExpanded ? 1 : 0,
                    child: AnimatedBuilder(
                      animation: _expandAnimation,
                      builder: (context, child) {
                        return Icon(
                          Icons.chevron_right,
                          color: widget.isDarkMode
                              ? Colors.white
                              : Colors.black,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _expandAnimation,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: _expandAnimation.value,
                  child: child,
                ),
              );
            },
            child: Column(
              children: [
                Divider(
                  height: 1,
                  color: widget.isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.1),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.destination.notes.isNotEmpty) ...[
                        Text(
                          widget.destination.notes,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 20),
                      ],
                      if (widget.destination.activities.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Activities',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: widget.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                            ),
                            const SizedBox(height: 12),
                            ...widget.destination.activities.map((activity) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: ActivityTile(
                                  activity: activity,
                                  tripId: widget.tripId,
                                  destinationId: widget.destination.id,
                                  isDarkMode: widget.isDarkMode,
                                ),
                              );
                            }).toList(),
                          ],
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'No activities yet',
                            style:
                                Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/add-activity',
                                  arguments: {
                                    'tripId': widget.tripId,
                                    'destinationId': widget.destination.id,
                                  },
                                );
                              },
                              icon: const Icon(Icons.add, size: 18),
                              label: const Text('Activity'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF00BFA5),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                context.read<TripProvider>()
                                    .deleteDestination(
                                  widget.tripId,
                                  widget.destination.id,
                                );
                              },
                              icon: const Icon(Icons.delete_outline,
                                  size: 18),
                              label: const Text('Delete'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Tile displaying a single activity with completion status
class ActivityTile extends StatelessWidget {
  final Activity activity;
  final String tripId;
  final String destinationId;
  final bool isDarkMode;

  const ActivityTile({
    Key? key,
    required this.activity,
    required this.tripId,
    required this.destinationId,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedCheckbox(
          value: activity.isCompleted,
          onChanged: (value) {
            context.read<TripProvider>().toggleActivityCompletion(
              tripId,
              destinationId,
              activity.id,
            );
          },
          activeColor: const Color(0xFF00BFA5),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onLongPress: () {
              context.read<TripProvider>().deleteActivity(
                tripId,
                destinationId,
                activity.id,
              );
            },
            child: AnimatedOpacity(
              opacity: activity.isCompleted ? 0.5 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: Text(
                activity.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  decoration: activity.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
