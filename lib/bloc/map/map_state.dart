part of 'map_bloc.dart';

@immutable
class MapState {

  final bool mapLoaded;
  final bool drawRoute;
  final bool followLocation;
  final LatLng centralLocation;
  final Map<String, Polyline> polylines;

  MapState({
    this.mapLoaded = false,
    this.drawRoute = false,
    this.followLocation = false,
    this.centralLocation,
    Map<String, Polyline> polylines
  }): this.polylines = polylines ?? new Map();

  copyWith({
    bool mapLoaded,
    bool drawRoute,
    bool followLocation,
    LatLng centralLocation,
    Map<String, Polyline> polylines
  }) => MapState(
    mapLoaded: mapLoaded ?? this.mapLoaded,
    drawRoute: drawRoute ?? this.drawRoute,
    followLocation: followLocation ?? this.followLocation,
    centralLocation: centralLocation ?? this.centralLocation,
    polylines: polylines ?? this.polylines,
  );

}
