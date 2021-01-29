part of 'widgets.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 70,
          left: 20,
          child: CircleAvatar(
            maxRadius: 25,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: (){

              }
              ),
            )
          ),

          Center(
            child: Transform.translate(
              offset: Offset(0, -12),

              child: Icon(Icons.location_on, size: 50,)
            ),
          )
      ],
    );
  }
}