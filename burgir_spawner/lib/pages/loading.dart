import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/list');
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         Image.asset(
             'assets/loading.png',
            width: 160,
            height: 160,
            color: Colors.white,
         ),
          SizedBox(
              height: 0
          ),
          Text(
            'Burgir Spawner',
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),
          ),
          SizedBox(
              height: 40
          ),
          SpinKitDualRing(
            color: Colors.white,
            size: 30,
          ),
        ],
      ),
    );
  }

  
}
