import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double largo;
  double ancho;

  final backGroundColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    ancho = screenSize.width;
    largo = screenSize.height;

    return Scaffold(
      
      resizeToAvoidBottomInset: false,

      body: Container(

          decoration: _decoracion(),
          width: ancho,
          height: largo,
        
        child: SingleChildScrollView(

                
            child: Column(
              children: <Widget>[
                _salto(largo * 0.15),
                _crearIcono(),
                _crearTitulo(),
                _salto(largo * 0.02),
                _crearEmail(),
                _salto(largo * 0.02),
                _crearPassword(),
                _salto(largo * 0.2),
                _mostrarAlertas(context)
              ],
            ),
          ),
      ),
      
    );
  }

  BoxDecoration _decoracion() {
    return BoxDecoration(
        gradient: LinearGradient(
            stops: [0.2, 0.6, 0.9],
            begin: FractionalOffset.topRight,
            end: FractionalOffset.bottomLeft,
            colors: [
              Color.fromRGBO(0, 0, 128, 1),
              Colors.lightBlue,
              Colors.white
            ]));
  }

  Widget _crearIcono() {
    return Icon(
      Icons.location_on,
      size: 100,
      color: Colors.blueAccent,
    );
  }

  Widget _crearTitulo() {
    return Text(
      'UrbanBus',
      style: TextStyle(color: Colors.white, fontSize: 30),
    );
  }

  Widget _crearEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        
        cursorColor: Colors.white,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: 'Email addres',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(
              Icons.email,
              color: Colors.black,
            )),
        onChanged: (valor) {
          setState(() {});
        },
      ),
    );
  }

  Widget _crearPassword() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                hintText: 'Contraseña',
                labelText: 'password',
                suffixIcon: Icon(Icons.no_encryption),
                icon: Icon(
                  Icons.lock,
                  color: Colors.black,
                )),
            onChanged: (valor) {
              setState(() {});
            },
          ),
        ),
        _salto(40),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'map'),
              child: Text(
                  '                    Iniciar sesion                    ')),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        FlatButton(
            onPressed: () {},
            //()=> Navigator.of(context).pop(),
            child: Text('¿Olvidaste tu contraseña?')),
      ],
    );
  }

  Widget _mostrarAlertas(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('¿Aun no tienes una cuenta?'),
              FlatButton(
                  onPressed: () {},
                  //()=> Navigator.of(context).pop(),
                  child: Text('Crear cuenta')),
            ],
          )
        ],
      ),
    );
  }

  Widget _salto(double espacio) {
    return Container(
      padding: EdgeInsets.only(top: espacio),
    );
  }
}
