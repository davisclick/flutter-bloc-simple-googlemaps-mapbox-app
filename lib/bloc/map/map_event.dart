part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnMapLoaded extends MapEvent {}

class OnMarkRoute extends MapEvent {}

class OnFollowLocation extends MapEvent {}

class OnCreateRouteStartDestination extends MapEvent {

  final List<LatLng> routeCoords;
  final double distance;
  final double duration;

  OnCreateRouteStartDestination(this.routeCoords, this.distance, this.duration);
}

class OnNewLocation extends MapEvent {

  final LatLng location;
  OnNewLocation(this.location);

}

class OnMapMoved extends MapEvent {

  final LatLng centerMap;
  OnMapMoved(this.centerMap);
}