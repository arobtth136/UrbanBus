import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPage createState() => _MapPage();
}

class _MapPage extends State<MapPage> {
  double largo;
  double ancho;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    ancho = screenSize.width;
    largo = screenSize.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
       
        body: Stack(
          children: <Widget>[
                        
          
                        _crearFlutterMap(),
                         _crarBotonLocalitation(),
                           __barraDeNavegacion(),
                        _crearMostrarInfo(),
                       
                                  ],
                                ));
                          }
                        
                          Widget _crearFlutterMap() {
                            return FlutterMap(
                              options: MapOptions(
                                center: LatLng(19.16, -96.15),
                                zoom: 16,
                              ),
                              layers: [
                                new TileLayerOptions(
                                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                                  additionalOptions: {
                                    'accessToken':
                                        'pk.eyJ1Ijoiam9yZ2VwZWRyb3phIiwiYSI6ImNrOTZhM3VocDAyZjQzZnRhbXNlcGV4dXAifQ.rgTSGENeKjvhI4CtEovLFA',
                                    'id': 'mapbox.streets',
                                  },
                                ),
                              ],
                            );
                          }
                        
                          Widget _crearMostrarInfo() {
                            return DraggableScrollableSheet(
                                initialChildSize: 0.45,
                                minChildSize: 0.05,
                                maxChildSize: 0.9,
                                builder: (BuildContext contex, scrollController) {
                                  return Container(
                                      decoration: _estiloSombreado(),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: SingleChildScrollView(
                                          controller: scrollController,
                                          child: Column(
                                            children: <Widget>[
                                              _barraGris(),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              _buscador(),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              _barraDeEspacio(),
                                                                  ],
                                                                ),
                                                              ),
                                                            ));
                                                      });
                                                }
                                              
                                                BoxDecoration _estiloSombreado() {
                                                  return BoxDecoration(
                                                      borderRadius: BorderRadius.circular(30.0),
                                                      color: Colors.white,
                                                      boxShadow: <BoxShadow>[
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 10.0,
                                                          spreadRadius: 2.0,
                                                          offset: Offset(2.0, 2.0),
                                                        )
                                                      ]);
                                                }
                                              
                                                Widget _barraGris() {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.black12,
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),
                                                    height: 6,
                                                    width: 70,
                                                  );
                                                }
                                              
                                                Widget _buscador() {
                                                  return Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20.0),
                                                    ),
                                                    width: largo * 0.45,
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                                        hintText: 'Buscar',
                                                        suffixIcon: Icon(Icons.search),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              
                                              Widget  _barraDeEspacio() {
                        
                        
                                                return Container(
                                                  
                                    decoration: BoxDecoration(
                                      border:Border(
                              bottom: BorderSide( //               
                                color: Color.fromRGBO(224,224, 224, 0.8),
                                width: 1.0,
                              ),
                              top: BorderSide( //                   
                                color: Color.fromRGBO(224,224, 224, 0.8),
                                width: 1.0,
                              ),
                              left: BorderSide(
                                color: Colors.white
                              ),
                              right: BorderSide(
                                color: Colors.white
                              )
                            ),
                         color: Color.fromRGBO(224,224, 224, 0.3),
                                    ),
                         width: ancho,
                         height: 7,
                        
                        
                        
                                                );}
                        
                      Widget  _crarBotonLocalitation() {
                         return Container(
                           
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.end,
            
                             children: <Widget>[
                              
                               Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: <Widget>[
                           
                                   FloatingActionButton(
                                     
                                    child: Icon(Icons.my_location, color: Colors.black,),
                                     backgroundColor: Colors.white,
                                     onPressed: (){}),
                                 ],
                               ),
                             ],
                           ));
                       }
            
           Widget   __barraDeNavegacion() {
             return Container(
              height: 80,
               width: ancho,
               color: Colors.white,

               child: Row(children: <Widget>[
                      
                 Container(
                   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                   color: Color.fromRGBO(0, 0, 124, 0.9),
                   width: ancho*0.5,
                   height: 150,
                   child: Text('Busca tu ruta', style: TextStyle(color: Colors.white),)),
                 
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                    color: Colors.blue,
                   width: ancho*0.5,
                   height: 150,
                    child: Text('     Conoce ', style: TextStyle(color: Colors.white),))
               ],),
             );
           }
}
