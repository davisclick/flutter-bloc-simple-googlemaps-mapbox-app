part of 'map_bloc.dart';

@immutable
class MapState {

  final bool mapLoaded;
  final bool drawRoute;
  final bool followLocation;

  final Map<String, Polyline> polylines;

  MapState({
    this.mapLoaded = false,
    this.drawRoute = false,
    this.followLocation = false,
    Map<String, Polyline> polylines
  }): this.polylines = polylines ?? new Map();

  copyWith({
    bool mapLoaded,
    bool drawRoute,
    bool followLocation,
    Map<String, Polyline> polylines
  }) => MapState(
    mapLoaded: mapLoaded ?? this.mapLoaded,
    drawRoute: drawRoute ?? this.drawRoute,
    followLocation: followLocation ?? this.followLocation,
    polylines: polylines ?? this.polylines,
  );

}
