part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnMapLoaded extends MapEvent {}

class OnMarkRoute extends MapEvent {}

class OnFollowLocation extends MapEvent {}

class OnNewLocation extends MapEvent {

  final LatLng location;

  OnNewLocation(this.location);

}

class OnMapMoved extends MapEvent {

  final LatLng centerMap;

  OnMapMoved(this.centerMap);
}