import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState());

  GoogleMapController _mapController;

  void initMap( GoogleMapController controller ){

    if( !state.mapLoaded ){
      this._mapController = controller;

      add( OnMapLoaded() );
    } 
  }

  @override
  Stream<MapState> mapEventToState( MapEvent event) async* {

    if( event is OnMapLoaded ){
      yield state.copyWith( mapLoaded: true );
    }
  }
}
