import 'package:flutter/material.dart';

import 'favor.dart';
import 'favors_list.dart';

class FavorDetailsPage extends StatelessWidget {

  final Favor _favor;

  const FavorDetailsPage({super.key, required Favor favor}): _favor = favor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FavorDetailsPage'),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _itemHeader(context, _favor),

                const SizedBox(height: 20),

                Expanded(
                    child: Center(
                      child: Hero(
                          tag: "${FavorCardItem.CARD_ITEM_DESCRIPT_HERO_TAG}_${_favor.uuid}",
                          child: Text(
                            _favor.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                      )
                    )
                )
              ],
            ),
          )
        ));
  }

  Widget _itemHeader(BuildContext context, Favor favor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Hero(
            tag: "${FavorCardItem.CARD_ITEM_AVATAR_HERO_TAG}_${favor.uuid}",
            child: CircleAvatar(
              backgroundImage: NetworkImage(favor.friend.photoURL),
              radius: 60.0,
            )
        ),

        const SizedBox(height: 16.0),

        Text(
          "${favor.friend.name} asked you to...",
          style: Theme.of(context).textTheme.displayMedium,
        )
      ]
    );
  }
}
