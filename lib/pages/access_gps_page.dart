import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class AccessGPSPage extends StatefulWidget {

  @override
  _AccessGPSPageState createState() => _AccessGPSPageState();
}

class _AccessGPSPageState extends State<AccessGPSPage> with WidgetsBindingObserver {

  bool popup = false;

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
    
    if( state == AppLifecycleState.resumed && !popup) {
      if( await Permission.location.isGranted ){
        Navigator.pushReplacementNamed(context, 'loading');
      }
    }
 }
  

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
                popup = true;
                final status = await Permission.location.request();
                await this.accessGPS( status );
                popup = false;
              }
            ),
          ],
        )
     ),
   );
  }

  Future accessGPS( PermissionStatus status ) async {
    
    switch ( status ) {
      
      case PermissionStatus.granted:
        await Navigator.pushReplacementNamed(context, 'loading');
        break;
      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }

  }
}