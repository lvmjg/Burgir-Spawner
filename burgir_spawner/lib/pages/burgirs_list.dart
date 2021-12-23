import 'package:burgir_spawner/pages/burgir.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class BurgirsList extends StatefulWidget {
  const BurgirsList({Key? key}) : super(key: key);

  @override
  _BurgirsListState createState() => _BurgirsListState();
}

class _BurgirsListState extends State<BurgirsList> {
  List<Burgir> burgirs = [
    new Burgir(name: 'Cheeseburger', restaurant: 'KFC', path: '1kfccheese.png'),
    new Burgir(
        name: 'Grander Texas', restaurant: 'KFC', path: '2kfcgrandertexas.jpg'),
    new Burgir(
        name: 'Hamburger', restaurant: 'BURGER KING', path: '1bghamburger.png'),
    new Burgir(
        name: 'Cheeseburger', restaurant: 'BURGER KING', path: '2bgcheese.png'),
    new Burgir(
        name: 'Chicken Burger',
        restaurant: 'BURGER KING',
        path: '3bgchicken.png'),
    new Burgir(
        name: 'Big King', restaurant: 'BURGER KING', path: '4bgbigking.png'),
    new Burgir(
        name: 'Whooper', restaurant: 'BURGER KING', path: '5bgwhooper.png'),
    new Burgir(
        name: 'Hamburger', restaurant: "McDonald's", path: '1mchamburger.png'),
    new Burgir(
        name: 'Cheeseburger', restaurant: "McDonald's", path: '2mccheese.png'),
    new Burgir(
        name: 'McChicken', restaurant: "McDonald's", path: '3mcchicken.png'),
    new Burgir(
        name: 'Jalapeño Burger',
        restaurant: "McDonald's",
        path: '4mcjalapeno.png'),
    new Burgir(
        name: 'Big Mac', restaurant: "McDonald's", path: '5mcbigmac.png'),
  ];

  ScrollController scr = ScrollController();
  bool tapped = false;
  int tappedIndex = -1;
  FlipCardController _controller = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burgir Spawner'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          controller: scr,
          itemCount: burgirs.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: FlipCard(
                  fill: Fill.fillBack,
                  direction: FlipDirection.VERTICAL,
                  back: Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('assets/' + burgirs[index].path,
                                height: 100),
                            SizedBox(width: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  burgirs[index].name,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.85),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 25),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  burgirs[index].restaurant,
                                  style: TextStyle(
                                      color: Colors.black12.withOpacity(0.85),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                ),

                              ],

                            )

                          ],

                        ),

                      ),
                      Divider(
                        color: Colors.grey.withOpacity(0.2),
                        height: 10,
                        thickness: 1,
                        indent: 15,
                        endIndent: 15,
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${burgirs[index].spawned}',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.85),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 70),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Colors.blue.withOpacity(0.04);
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed))
                                  return Colors.blue.withOpacity(0.12);
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              burgirs[index].spawned++;
                            });
                          },
                          child: Text('Spawn Burgir')),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                '! Be careful burgir will appear on your table !',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                              ),
                            ),
                          ]
                      ),
                    ],
                  )),
                  onFlip: () {
                    setState(() {
                      tapped = true;
                      tappedIndex = index;
                    });
                  },
                  front: Opacity(
                    opacity:
                        tapped ? (tappedIndex == index ? 1.0 : 0.3) : 1.0,
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/' + burgirs[index].path,
                            height: 250),
                        Text(
                          burgirs[index].name,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.85),
                              fontWeight: FontWeight.w300,
                              fontSize: 30),
                        ),
                        SizedBox(height: 10),
                        Text(
                          burgirs[index].restaurant,
                          style: TextStyle(
                              color: Colors.black12.withOpacity(0.85),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                        SizedBox(height: 15)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
