
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResult {

  final bool canceled;
  final bool manual;
  final LatLng position;
  final String nameDestination;
  final String description;

  SearchResult({
    @required this.canceled, 
    this.manual, 
    this.position, 
    this.nameDestination, 
    this.description
  });


}