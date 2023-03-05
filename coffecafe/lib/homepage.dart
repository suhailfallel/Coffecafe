import 'package:coffecafe/itemhome.dart';
import 'package:coffecafe/main.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home1();
  }
}

class Home1 extends State<Homepage> with TickerProviderStateMixin {
  late TabController cn;
  int tab = 0;

  @override
  void initState() { cn = TabController(length: 1, vsync: this);}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CoffeCafe'
        ),
        actions: [
          IconButton(onPressed: () {
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => Myapp()));
          }, 
          icon: const Icon(Icons.logout))
        ],
      ),
      body: TabBarView(
        controller: cn,
        children: [
          Container(
            child: homeBody(),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          cn.animateTo(value);
          setState(() {
            tab = value;
          });
        },
        currentIndex: tab,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }

  Widget homeBody() {
    return Container(
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
            child: const Text(
              'CoffeCafe',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
                fontSize: 40,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Food & Drinks Menu',
              style: TextStyle(
                color: Color.fromARGB(255, 129, 69, 69),
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 150,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Itemhome(api:'https://mocki.io/v1/c77ebfbf-95a6-427e-9a75-0192bb431713',)));
                  },
                  child: const Text(
                    'Coffee',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 150,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Itemhome(api:'https://mocki.io/v1/ff8cd0f7-8d6d-4960-881e-a053ce2c27ad',)));
                  },
                  child: const Text(
                    'Tea',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 150,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Itemhome(api:'https://mocki.io/v1/cb0beecf-8d77-4d0d-96f1-240d51fd7e4b',)));
                  },
                  child: const Text(
                    'Snacks',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 150,
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Itemhome(api:'https://mocki.io/v1/aa2b3f2c-c505-42de-ae0d-368503883d10',)));
                  },
                  child: const Text(
                    'Pastries',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  
}

