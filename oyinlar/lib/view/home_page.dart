import 'package:flutter/material.dart';
import 'package:oyinlar/provider/home_provider.dart';
import 'package:oyinlar/view/history.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  int redCar = 0;
  int bluCar = 0;
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return Scaffold(
          body: Column(
            children: [
              InkWell(
                onTap: () {
                  homeProvider.onFerrariGamerTop();
                  if (homeProvider.isRedGamerWin) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Ferrari win"),
                          content: SizedBox(
                            height: 230,
                            child: Column(
                              children: [Image.asset("assets/winner.gif")],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                redCar++;
                                homeProvider.restartGame();
                                Navigator.pop(context);
                              },
                              child: const Text("Restart"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                redCar++;
                                homeProvider.historyGame();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return History(
                                          redGamewinner: redCar,
                                          blueGamewinner: bluCar);
                                    }),
                                  ),
                                );
                              },
                              child: const Text("History"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      homeProvider.redGamer,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://image.cnbcfm.com/api/v1/image/105940475-1559232349684190164-car-ferrari-sf90-stradale.jpg?v=1559232362&w=929&h=523&vtcrop=y"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  homeProvider.onTeslaGamerTop();
                  if (homeProvider.isBlueGamerWin) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Tesla win"),
                          content: SizedBox(
                            height: 230,
                            child: Column(
                              children: [Image.asset("assets/winner.gif")],
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                bluCar++;
                                homeProvider.restartGame();
                                Navigator.pop(context);
                              },
                              child: const Text("Restart"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                homeProvider.historyGame();
                                bluCar++;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) {
                                      return History(
                                          redGamewinner: redCar,
                                          blueGamewinner: bluCar);
                                    }),
                                  ),
                                );
                              },
                              child: const Text("History"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      homeProvider.blueGamer,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.prismic.io/onto-marketing-site/9e0bba8f-3e2e-4659-9147-8538e69a8c28_Tesla-2000x1480-5.jpg?ixlib=react-9.0.3&auto=format&fit=crop&q=10&ar=9%3A7"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
