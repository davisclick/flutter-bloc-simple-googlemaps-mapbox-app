import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:mapa_app/themes/uber_map.dart';
import 'package:meta/meta.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapState());

  GoogleMapController _mapController;

  Polyline _myRoute = new Polyline(
    polylineId: PolylineId("myRoute"),
    width: 4,
    color: Colors.transparent,
    points: []
  );

  Polyline _myRouteDestination = new Polyline(
    polylineId: PolylineId("myRouteDestination"),
    width: 4,
    color: Colors.black87,
    points: []
  );

  void initMap( GoogleMapController controller ){

    if( !state.mapLoaded ){
      this._mapController = controller;
      this._mapController.setMapStyle( jsonEncode(uberMapTheme) );

      add( OnMapLoaded() );
    } 
  }

  void moveCamara( LatLng destination ){
     final cameraUpdate = CameraUpdate.newLatLng(destination);
     this._mapController?.animateCamera(cameraUpdate); 
  }

  @override
  Stream<MapState> mapEventToState( MapEvent event) async* {

    if( event is OnMapLoaded ){
      yield state.copyWith( mapLoaded: true );

    }else if( event is OnNewLocation ){
      yield*  this._onNewLocation(event);

    }else if ( event is OnMarkRoute ) {
       yield*  this._onMarkRoute( event );

    }else if ( event is OnFollowLocation ) {
       yield*  this._onFollowLocation( event );

    }else if ( event is OnMapMoved ) {
       yield*  this._onMapMoved( event );

    }else if ( event is OnCreateRouteStartDestination ) {
       yield*  this._onCreateRouteStartDestination( event );

    }
  }

  Stream<MapState> _onNewLocation( OnNewLocation event ) async * {

    if ( state.followLocation ){
      this.moveCamara( event.location );
    }

    List<LatLng> points = [...this._myRoute.points, event.location];
     this._myRoute = this._myRoute.copyWith( pointsParam: points );

     final currentPolylines = state.polylines;
     currentPolylines['myRoute'] = this._myRoute;

      yield state.copyWith( polylines: currentPolylines );

  }

  Stream<MapState> _onMarkRoute( OnMarkRoute event ) async * {

    if( !state.drawRoute ){
        this._myRoute = this._myRoute.copyWith( colorParam:  Colors.black87 );
    }else{
        this._myRoute = this._myRoute.copyWith( colorParam:  Colors.transparent);
    }

    final currentPolylines = state.polylines;
    currentPolylines['myRoute'] = this._myRoute;

    yield state.copyWith( 
      drawRoute: !state.drawRoute,
      polylines: currentPolylines 
    );
  }

  Stream<MapState> _onFollowLocation( OnFollowLocation event ) async * {
     if( !state.followLocation ){
        this.moveCamara(this._myRoute.points[ this._myRoute.points.length - 1 ] );
      }
      yield state.copyWith( followLocation: !state.followLocation );
  }

  Stream<MapState> _onMapMoved( OnMapMoved event ) async * {
      yield state.copyWith( centralLocation: event.centerMap );
  }

  Stream<MapState> _onCreateRouteStartDestination( OnCreateRouteStartDestination event ) async * {

    this._myRouteDestination = this._myRouteDestination.copyWith(
      pointsParam: event.routeCoords
    );

    final currentPolynines = state.polylines;
    currentPolynines['myRouteDestination'] = this._myRouteDestination;

      yield state.copyWith(
        polylines: currentPolynines,
      );
  }
}

