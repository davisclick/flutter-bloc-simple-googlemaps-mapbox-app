import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mapa_app/themes/uber_map.dart';
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

      this._mapController.setMapStyle( jsonEncode(uberMapTheme) );

      add( OnMapLoaded() );
    } 
  }

  void moveCamara( LatLng position ){
     final cameraUpdate = CameraUpdate.newLatLng(position);
     this._mapController?.animateCamera(cameraUpdate); 
  }

  @override
  Stream<MapState> mapEventToState( MapEvent event) async* {

    if( event is OnMapLoaded ){
      yield state.copyWith( mapLoaded: true );
    }
  }
}
