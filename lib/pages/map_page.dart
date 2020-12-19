
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_app/bloc/my_location/my_location_bloc.dart';


class MapPage extends StatefulWidget {

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  @override
  void initState() {

    context.read<MyLocationBloc>().startTracing();
    super.initState();
  }

  @override
  void dispose() {
    context.read<MyLocationBloc>()..cancelTracing();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      body: Center(
        child: BlocBuilder<MyLocationBloc, MyLocationState>(
          builder: (_, state) => createMap( state )
        )
     ),
   );
  }

  Widget createMap(MyLocationState state) {

    if( !state.locationExists ) return Center(child: Text('Locating...'));

    final cameraPosition = new CameraPosition(
      target: state.location,
      zoom: 15
    );

    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      
    );

  }
}