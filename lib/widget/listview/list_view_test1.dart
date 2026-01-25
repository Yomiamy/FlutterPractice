import 'package:flutter/material.dart';

class ListViewTest1 extends StatelessWidget {
  const ListViewTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListViewTest1', style: TextStyle(fontSize: 30)),
        ),
        body: ListView(
          shrinkWrap: true,
          children: const [
            Text('pp_time_stats: avg=46.05ms min=13.83ms max=659.69ms count=22', style: TextStyle(fontSize: 22)),
            Text('pp_time_stats: avg=46.05ms min=13.83ms max=659.69ms count=22', style: TextStyle(fontSize: 22)),
            Text('pp_time_stats: avg=46.05ms min=13.83ms max=659.69ms count=22', style: TextStyle(fontSize: 22))
          ],
        ));
  }
}
