part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: GestureDetector(
          onTap: (){
            print('Hello...!');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: width,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical: 15),
              width: double.infinity,
              height: 50,
              child: Text('Where do you want to go?', style: TextStyle(color: Colors.black87)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow:  [
                  BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 5)),
                ]
              )
            ),
      ),
        ),
    );
  }
}