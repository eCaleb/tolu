import 'package:flutter/material.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 298.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          "assets/images/mouse.png",
                          
                        )),
                    GestureDetector(
                        onTap: () {
                        },
                        child: Image.asset(
                          "assets/images/fruit.png",
                       
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Mouse trap",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text("Fruit ninja",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/sing.png",
                      
                      )),
                  GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/avenge.png",
                        
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Hero dash",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  Text("Sing along",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
