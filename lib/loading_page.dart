
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mapa_app/access_gps_page.dart';
import 'package:mapa_app/helpers/helpers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mapa_app/map_page.dart';


class LoadingPage extends StatefulWidget  {

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver  {

   @override
  void initState() {

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

   @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    
    if( state == AppLifecycleState.resumed ) {
      if( await Geolocator.isLocationServiceEnabled() ){
        Navigator.pushReplacement(context, navigationMapFadeIn(context, MapPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGPSLocation( context ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
         
         if( snapshot.hasData ){
            return Center(
            child: Text( snapshot.data ),
          );
         }else{
           return CircularProgressIndicator(strokeWidth: 2);
         }
        },
      ),
   );
  }

  Future checkGPSLocation(BuildContext context ) async {

    final permissionGPS = await Permission.location.isGranted;
    final activeGPS = await Geolocator.isLocationServiceEnabled();

    if( permissionGPS && activeGPS ) {
      Navigator.pushReplacement(context, navigationMapFadeIn(context, MapPage()));
      return '';
    }else if( !permissionGPS ){
      Navigator.pushReplacement(context, navigationMapFadeIn(context, AccessGPSPage()));
      return "It's necessary to enable the GPS";
    }else{
      return 'Active the GPS';
    }
    
  }
}