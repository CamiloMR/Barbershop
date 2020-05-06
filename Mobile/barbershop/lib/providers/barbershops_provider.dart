import 'dart:async';
import 'dart:convert';

import 'package:barbershop/models/barbershops_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider{
  String _apikey='99c846308d0eea3a4a5ce2a189339cf7';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage=3;

  List<Pelicula> _populares =new List();


  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStream.sink.add;//agrega peliculas al afluente

  Stream <List<Pelicula>>get popularesStream => _popularesStream.stream;



  void disposeStreams(){//Valida si hay un stream o si no lo cierra
    _popularesStream?.close();
  }

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
     
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key'  : _apikey,
      'language' : _language
    });
    return await _procesarRespuesta(url);  
  }
   Future<List<Pelicula>> getPopulares() async {
    
     _popularesPage ++;
    
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key'  : _apikey,
      'language' : _language,
      'page'      :_popularesPage.toString()
    });

    final resp = await _procesarRespuesta(url);
    
    _populares.addAll(resp);
    popularesSink(_populares);

    return resp;
  
  }

//  Future<List<Pelicula>> getAdultos() async{
  //  final url = Uri.https(_url, '');
  //}

} 