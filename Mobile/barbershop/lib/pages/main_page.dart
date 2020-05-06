import 'package:barbershop/providers/barbershops_provider.dart';
import 'package:barbershop/widgets/card_swiper_widget.dart';
import 'package:barbershop/widgets/listview_barbershops.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search), 
          onPressed: (){}),
        ],),
        body: Container(
          child: Column(
            children: <Widget>[
              _swipeTarjetas(),
            ],
          ),
        ),
    );
  }

  Widget _swipeTarjetas() {
      return FutureBuilder(
        future: peliculasProvider.getEnCines(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return ListBarbershops(peliculas: snapshot.data,siguientePagina: peliculasProvider.getPopulares);
              }else {
                return Container(
            
                  height: 300.0,
                  child: Center(
                    child: CircularProgressIndicator(

              )),
                );
              }
            
        },
      );

  }
  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('populares',style:Theme.of(context).textTheme.subhead)
          ),
          SizedBox(height: 5.0,),

          StreamBuilder(
           stream: peliculasProvider.popularesStream,
          
            builder: (BuildContext context, AsyncSnapshot snapshot){
             if (snapshot.hasData) {
               return ListBarbershops(
                 peliculas: snapshot.data,
                 siguientePagina: peliculasProvider.getPopulares,
                 );
              }else {
                return Center(child: CircularProgressIndicator( ));
              }
            }
          )
        ],
      ),
    );
  }
  
}