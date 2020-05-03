  import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email  = '';
  String _password ='';
  bool _obscureText= true;
  TextStyle _textStyle = new TextStyle(color: Colors.white);
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          
          children: <Widget>[
            Divider(
            color: Colors.transparent,
            height: 50.0,
            ),
            _createImage(),
            Divider( height: 50.0,),
            _createEmail(),
            Divider(),
            _createPassword(),
            Divider(),
            _createButton(),
            _createOptions(),
          ],
        ),
      ),
    );
  }
  Widget _createImage() {
    final card = Container(
      width: 200.0,
      height: 200.0,
      child: Image(
      image: AssetImage('assets/logo.jpeg'),
      width: 300.0,
      height: 200.0,
      fit: BoxFit.contain,
      ),
    );

    return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
         color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
      ),
    );
  }

  Widget _createEmail() {
    return TextField(
      
      style:_textStyle,
      cursorColor: Colors.white,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintStyle: _textStyle,
        labelStyle: _textStyle,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
          
          
          
        ),  
      labelText: 'Correo Electrónico:',
      suffixIcon: Icon(Icons.alternate_email, color: Colors.white,),
      prefixIcon: Icon(Icons.email, color: Colors.white,),

      ),
      onChanged: (valor) =>setState(() {
        _email = valor;
      })

    );
  }

  Widget _createPassword() {

    
    return TextField(
      style:_textStyle,
      obscureText: _obscureText,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintStyle: _textStyle,
        labelStyle: _textStyle,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      labelText: 'Contraseña:',
      suffixIcon: GestureDetector(
        dragStartBehavior: DragStartBehavior.down,
        onTap: (){
          setState(() {
            _obscureText = !_obscureText;
          });
        },
        child: Icon(
      _obscureText ? Icons.visibility : Icons.visibility_off,
      color: Colors.white,),
        
        ),
      prefixIcon: Icon(Icons.lock, color: Colors.white),
      ),
      onChanged: (valor) =>setState(() {
        _password = valor;
      })

    );
  }

  Widget _createButton() {
    return MaterialButton(
          child: Text('Ingresar'),
          color: Colors.white,
          height: 50.00,
          textColor: Colors.black,
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {},
        );
  }

  Widget _createOptions() {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text('¿Has olvidado tu contraseña?'),
          color: Colors.transparent,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('Registrate'),
          color: Colors.transparent,
          textColor: Colors.white,
          shape: StadiumBorder(),
          onPressed: () {},
        )
      ]
    );

  }
  
}
 