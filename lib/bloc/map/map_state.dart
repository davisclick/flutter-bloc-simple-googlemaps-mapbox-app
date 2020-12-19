part of 'map_bloc.dart';

@immutable
class MapState {

  final mapLoaded;

  MapState({
    this.mapLoaded = false
  });

  copyWith({
    bool mapLoaded
  }) => MapState(
    mapLoaded: mapLoaded ?? this.mapLoaded
  );

}
