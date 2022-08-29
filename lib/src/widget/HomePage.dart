import 'package:flutter/material.dart';
import 'package:helloworld/src/widget/BuyPage.dart';
import 'package:helloworld/src/widget/PlayPage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _deducrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 10) - 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  final List<Items> entries = <Items>[
    Items(1, const AssetImage('lib/src/assets/images/basketthrowingtechniques.png'), const AssetImage('lib/src/assets/images/3.png'), 'Basket Throwing Techniques'),
    Items(2, const AssetImage('lib/src/assets/images/LEADINGTHEFLAG.png'), const AssetImage('lib/src/assets/images/2.png'), 'Leading The Flag'),
    Items(3, const AssetImage('lib/src/assets/images/SHOULDSHOULDVATTHECHALLENGE.png'), const AssetImage('lib/src/assets/images/6.png'), 'Should Should V At The Challenge'),
    Items(4, const AssetImage('lib/src/assets/images/STUNNINGTECHNIQUESATTHECHAIN.png'), const AssetImage('lib/src/assets/images/1.png'), 'Stunning Techniques At The Chain'),
    Items(5, const AssetImage('lib/src/assets/images/targetimage.png'), const AssetImage('lib/src/assets/images/5.png'), 'Target'),
    Items(6, const AssetImage('lib/src/assets/images/defense.png'), const AssetImage('lib/src/assets/images/4.png'), 'Defense'),
  ];
  
  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
        return prefs.getInt('counter') ?? 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/src/assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          
          child: FutureBuilder<int>(
            future: _counter,
            builder: (BuildContext context,AsyncSnapshot<int> snapshot) {
              if(snapshot.hasData){
                return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.15,
                    child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: width * 0.2,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          icon: Image.asset('lib/src/assets/images/eye.png'),
                                          iconSize: 50,
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => const BuyPage()),
                                            );
                                          },
                                        ),
                                        Text(snapshot.data.toString()),
                                      ],
                                    ),
                                  ),
          
                                ],
                            )
                  ),
                  SizedBox(
                    height: height * 0.15,
                    width: width,
                    child: const Image(
                        image: AssetImage("lib/src/assets/images/basketballtip.png"),
                        fit: BoxFit.contain,
                      ),
                  ),
                  SizedBox(
                    height: height * 0.8,
                    child: ListView.separated(
                      itemCount: entries.length,
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (() => {
                            if(snapshot.data != 0){
                            Navigator.pushNamed(
                              context,
                              PlayPage.routeName,
                              arguments: ScreenArguments(entries[index].background,entries[index].name),
                            ),
                            _deducrementCounter()
                            }else{
                              showDialog(context: this.context, builder: (context) {
                                return AlertDialog(
                                  title: const Text("Alert"),
                                  content: const Text('Please buy more turn!'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },)
                            }
                          }),
                          child: SizedBox(
                            height: height * 0.1,
                            width: width * 0.6,
                            child: Image(
                              image: entries[index].image,
                              fit: BoxFit.contain,
                            ),
                          )
                        );
                      },
                    ),
                  )
              ]);
              }else{
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              } 
          ),
        ),
      ),
    );
  }
}

class Items {
  int id;
  AssetImage image;
  AssetImage background;
  String  name;

  Items(this.id, this.image, this.background, this.name);
}

class ScreenArguments {
  final AssetImage background;
  final String name;

  ScreenArguments(this.background, this.name);
}