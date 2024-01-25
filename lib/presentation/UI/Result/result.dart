import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80,top: 25),
                child: Container(
                  height: 300,
                  // padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                      // color: Colors.black54,
                      borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(0),
                  )),
                  child: Row(
                    children: [
                      // user image
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(80),
                                    bottomLeft: Radius.circular(80),
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(80)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                      blurRadius: 10)
                                ]),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                "Assets/Images/me.jpg",
                                fit: BoxFit.cover,
                                width: 250,
                                height: 250,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 80,top: 25),
                child: Container(
                  height: 300,
                  // padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    // color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(0),
                      )),
                  child: Row(
                    children: [
                      // user image
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(80),
                                    bottomLeft: Radius.circular(80),
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(80)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.25),
                                      offset: const Offset(0, 4),
                                      blurRadius: 10)
                                ]),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.asset(
                                "Assets/Images/me.jpg",
                                fit: BoxFit.cover,
                                width: 250,
                                height: 250,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      )
    );
  }
}
