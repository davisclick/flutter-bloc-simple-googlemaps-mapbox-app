

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_app/models/traffic_response.dart';

class TrafficService {

  //Singleton
  TrafficService._privateConstructor();
  static final TrafficService _instance = TrafficService._privateConstructor();
  factory TrafficService(){
    return _instance;
  }

  final _dio = new Dio();
  final _baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey  = 'pk.eyJ1IjoiZGF2aXNjbGljayIsImEiOiJja2ozamN1YjMwcmV3MnlzYncwNTlnYnVzIn0.D5D9V7XloODbd8YXyfec-w';

  Future getCoordsStartAndEnd( LatLng start, LatLng end ) async {

   

    final coordString = '${ start.longitude },${ start.latitude };${ end.longitude },${ end.latitude }';
    final url = '${ this._baseUrl }/mapbox/driving/$coordString';

    final resp = await this._dio.get(url, queryParameters: {
      'alternatives': 'true',
      'geometries': 'polyline6',
      'steps': 'false',
      'access_token': this._apiKey,
      'language': 'es',
    });

    final data = DrivingResponse.fromJson(resp.data);
    

    return data;
  }

}