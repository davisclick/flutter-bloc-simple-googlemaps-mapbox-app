part of 'widgets.dart';

class SearchBar extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        
        if( state.manualSelection ){
          return Container();
        }else{
          return FadeInDown(
            duration: Duration(milliseconds: 300),
            child: buildSearchBar(context)
          );
        }

      },
    );
  }


  Widget buildSearchBar(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: GestureDetector(
          onTap: () async {
            print('Hello...!');
            final result = await showSearch(context: context, delegate: SearchDestination());
            this.retornoBusqueda( context, result );
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

  void retornoBusqueda( BuildContext context,  SearchResult result ){

    if( result.canceled ) return;

    if( result.manual ){
      context.read<SearchBloc>().add( OnActiveManualMarker() );
      return;
    }
  }

  
}