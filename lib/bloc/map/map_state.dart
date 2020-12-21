part of 'map_bloc.dart';

@immutable
class MapState {

  final bool mapLoaded;
  final bool drawRoute;

  final Map<String, Polyline> polylines;

  MapState({
    this.mapLoaded = false,
    this.drawRoute = false,
    Map<String, Polyline> polylines
  }): this.polylines = polylines ?? new Map();

  copyWith({
    bool mapLoaded,
    bool drawRoute,
    Map<String, Polyline> polylines
  }) => MapState(
    mapLoaded: mapLoaded ?? this.mapLoaded,
    drawRoute: drawRoute ?? this.drawRoute,
    polylines: polylines ?? this.polylines,
  );

}
