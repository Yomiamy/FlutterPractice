import 'package:flutter/material.dart';

class RadiusTest1 extends StatefulWidget {
  const RadiusTest1({super.key});

  @override
  State<RadiusTest1> createState() => _RadiusTest1State();
}

class _RadiusTest1State extends State<RadiusTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("RadiusTest1"),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.star), Text('小王子: 你，就只有你，擁有會笑的星星')])),

            const SizedBox(height: 10),

            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                  'https://m.media-amazon.com/images/M/MV5BZTZlZWM0MTEtMWFkZC00MDU4LTgwZTgtNDM1YjQwZWZjYzdhXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg'),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(8.0),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star),
                  Text('小王子: 你，就只有你，擁有會笑的星星'),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.blue,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star),
                    Text('小王子: 你，就只有你，擁有會笑的星星'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Colors.yellow,
              child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(Icons.star),
                    Text('小王子: 你，就只有你，擁有會笑的星星'),
                  ])),
            ),

            const SizedBox(height: 10),

            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star),
                    Text('小王子: 你，就只有你，擁有會笑的星星'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            DecoratedBox(
              decoration: ShapeDecoration(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star),
                    Text('小王子: 你，就只有你，擁有會笑的星星'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star),
                      Text('Material - 小王子: 你，就只有你，擁有會笑的星星'),
                    ],
                  ),
                )),

            const SizedBox(height: 10),

            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: const Text('button')),

            const SizedBox(height: 10),

            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )
                  ),
                ),
              )
            )
          ]),
        ));
  }
}
