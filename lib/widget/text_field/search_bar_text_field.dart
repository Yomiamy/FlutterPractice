import 'package:flutter/material.dart';

class SearchStaticBarTextField extends StatelessWidget {
  const SearchStaticBarTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SearchStaticBarTextField'),
        ),
        body: SearchStaticBar(
          heroTag: "111",
        )
    );
  }
}


class SearchStaticBar extends StatelessWidget {

  String hint;
  String heroTag;
  double defaultBorderRadius;
  EdgeInsets margin;
  EdgeInsets padding;
  Function? clickCallback;
  Color splashColor;

  SearchStaticBar({
    this.hint = "Search...",
    this.defaultBorderRadius = 30.0,
    this.margin = const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
    this.padding = const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 10.0, right: 10.0),
    this.splashColor = const Color(0xFFD6D6D6),
    this.clickCallback,
    required this.heroTag,
}):super(key: const Key("SearchStaticBar"));

  @override
  Widget build(BuildContext context) => Container(
    height: 80,
    margin: margin,
    padding: padding,
    child: Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(defaultBorderRadius)
        ),
        child: InkWell(
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(defaultBorderRadius),
          onTap: () => {
            clickCallback?.call()
          },
          child: _buildHeroWidget(context),
        )
      )
    )
  );

  _buildHeroWidget(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: _buildContainer(context)
    );
    }

  _buildContainer(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    alignment: const Alignment(-1, 0),
    padding: padding,
    child: _buildRow(),
  );

  _buildRow() => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        "images/search_icon.png"
      ),
      const SizedBox(width: 8.0),
      Text(hint,
          style: const TextStyle(color: Color(0xff999999), fontSize: 16.0)
      )
    ]
  );
}
