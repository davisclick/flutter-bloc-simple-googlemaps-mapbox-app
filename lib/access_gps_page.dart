import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class AccessGPSPage extends StatefulWidget {

  @override
  _AccessGPSPageState createState() => _AccessGPSPageState();
}

class _AccessGPSPageState extends State<AccessGPSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("It's necessary to enable the GPS"),
            MaterialButton(
              child: Text('Enable Access', style: TextStyle( color: Colors.white ),),
              color:  Colors.black,
              shape: StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () async {
                final status = await Permission.location.request();

                this.accessGPS( status );
              }
            ),
          ],
        )
     ),
   );
  }

  void accessGPS( PermissionStatus status ){
    
    switch ( status ) {
      
      case PermissionStatus.granted:
        Navigator.pushReplacementNamed(context, 'map');
        break;
      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }

  }
}