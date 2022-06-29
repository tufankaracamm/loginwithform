import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var formKey = GlobalKey<FormState>();
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: tfKullaniciAdi,
                    decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                    validator: (tfGirdisi){
                      if(tfGirdisi!.isEmpty){
                        return "kullanıcı adı giriniz";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: tfSifre,
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Şifre Giriniz"),
                    validator: (tfGirdisi){
                      if(tfGirdisi!.isEmpty){
                        return "Şifre Giriniz";
                      }
                      if(tfGirdisi.length<6){
                        return "Şifreniz en az 6 haneli olmalıdır";
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: (){
                         bool kontrolSonucu = formKey.currentState!.validate();
                         if(kontrolSonucu){
                           String ka = tfKullaniciAdi.text;
                           String s = tfSifre.text;
                           print("Kullanıcı adı : $ka Şifre: $s");
                         }
                      },
                      child: Text("Giriş"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
