
import 'package:flutter/material.dart';
import 'package:mapa_app/access_gps_page.dart';

import 'package:mapa_app/helpers/helpers.dart';
//import 'package:mapa_app/map_page.dart';


class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGPSLocation( context ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
          child: CircularProgressIndicator(strokeWidth: 2,),

          );
        },
      ),
   );
  }

  Future checkGPSLocation(BuildContext context ) async {

    await Future.delayed( Duration(milliseconds: 1000));

    print('Loading page...');

    //Navigator.pushReplacement(context, navigationMapFadeIn(context, AccessGPSPage()));
    //Navigator.pushReplacement(context, navigationMapFadeIn(context, MapPage()));
  }
}