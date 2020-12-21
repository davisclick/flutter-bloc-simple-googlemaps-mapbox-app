part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnMapLoaded extends MapEvent {}

class OnNewLocation extends MapEvent {

  final LatLng location;

  OnNewLocation(this.location);

}