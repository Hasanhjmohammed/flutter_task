import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/Widget/notification.dart';
import 'package:flutter_task/Widget/notification.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/LogIn/loginscreen.dart';
import 'Screen/Product/productscreen.dart';
import 'Widget/notification.dart';
import 'api/auth.dart';
import 'api/product.dart';
import 'model/productmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //notification().initaliazationnotification();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getString("myuser")==null )
  { MyApp.Myhome=LogIn();
  } else
  {
    MyApp.Myhome=MyProduct();
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>products()),
      ChangeNotifierProvider(create: (_)=>auth()),
    ],
    child: MyApp(),
  ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
 static  var Myhome;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyProduct(),
    );
  }
}

