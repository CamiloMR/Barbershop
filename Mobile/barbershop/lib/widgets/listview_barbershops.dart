import 'package:barbershop/models/barbershops_model.dart';
import 'package:flutter/material.dart';

class ListBarbershops extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  ListBarbershops({@required this.peliculas,@required this.siguientePagina});
  final _pageController = new PageController(
  initialPage: 1,
  viewportFraction: 0.3 
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    
    _pageController.addListener((){
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent -200){
        siguientePagina();  
      }
    });
    
    
  return Expanded(
          child: Container(
          height: _screenSize.height *0.3,
          child: PageView(
            controller: _pageController,
            children: _list(context),
          ),

        ),
      );
    }

  List<Widget> _list(BuildContext context) {
    return peliculas.map((pelicula){
        return ListView.builder(
          itemCount: peliculas.length,
          itemBuilder:(BuildContext context,int index){
            return ListView(
                  children: <Widget>[
                    ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: FadeInImage(
                    placeholder: AssetImage('assets/img/noImage.jpg'), 
                    image: NetworkImage(pelicula.getPosterImg()),
                    height: 130.0,
                  ),
                ),
                Text(
                  pelicula.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption,
                )
                  ],
            );
        
        
          },
      );
    }).toList();
  }
}