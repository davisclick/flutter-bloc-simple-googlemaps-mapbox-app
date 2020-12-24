
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapa_app/bloc/map/map_bloc.dart';
import 'package:mapa_app/bloc/my_location/my_location_bloc.dart';
import 'package:mapa_app/widget/widgets.dart';


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
      body: BlocBuilder<MyLocationBloc, MyLocationState>(
          builder: (_, state) => createMap( state )
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BtnLocation(),
            BtnFollowLocation(),
            BtnMyRoute()
          ],
        )
   );
  }

  Widget createMap(MyLocationState state) {

    if( !state.locationExists ) return Center(child: Text('Locating...'));

    final mapBloc = BlocProvider.of<MapBloc>(context);

    mapBloc.add(OnNewLocation(state.location));

    final cameraPosition = new CameraPosition(
      target: state.location,
      zoom: 15
    );

    return GoogleMap(
      initialCameraPosition: cameraPosition,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: mapBloc.initMap,
      polylines: mapBloc.state.polylines.values.toSet(),
    );

  }
}