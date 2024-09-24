import 'package:flutter/material.dart';

class OverlayTest1 extends StatefulWidget {
  const OverlayTest1({super.key});

  @override
  OverlayTest1State createState() => OverlayTest1State();
}


class OverlayTest1State extends State<OverlayTest1> {

  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
  }

  // 創建 OverlayEntry，這裡是我們希望疊加顯示的 widget
  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 100.0,
        left: 50.0,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 200,
            height: 100,
            color: Colors.blue.withOpacity(0.8),
            child: const Center(
              child: Text(
                'This is an Overlay',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overlay Example"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ((context.findRenderObject() as RenderBox).size).width;
                ((context.findRenderObject() as RenderBox).size).height;

                if (_overlayEntry == null) {
                  _showOverlay();
                }
              },
              child: const Text('Show Overlay'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _removeOverlay();
              },
              child: const Text('Remove Overlay'),
            ),
          ],
        ),
      ),
    );
  }
}
