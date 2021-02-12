import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_app/bloc/map/map_bloc.dart';
import 'package:mapa_app/bloc/my_location/my_location_bloc.dart';
import 'package:mapa_app/bloc/search/search_bloc.dart';
import 'package:mapa_app/helpers/helpers.dart';
import 'package:mapa_app/models/search_result.dart';
import 'package:mapa_app/search/search_destination.dart';
import 'package:mapa_app/services/traffic_service.dart';

import 'package:polyline/polyline.dart' as Poly;

part 'btn_location.dart';
part 'btn_my_route.dart';
part 'btn_follow_location.dart';
part 'searchbar.dart';
part 'manual_marker.dart';
