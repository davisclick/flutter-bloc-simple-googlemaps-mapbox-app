part of 'widgets.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
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
          ),

          Positioned(
            bottom: 70,
            left: 40,
            child: MaterialButton(
              minWidth: width - 120,
              child: Text('Confirm destination',style: TextStyle( color: Colors.white )),
              color: Colors.black,
              shape: StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () {

              },
            )
          )
      ],
    );
  }
}