
import 'package:flutter/material.dart';


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

    Navigator.pushReplacementNamed(context, 'map');

  }
}