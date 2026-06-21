import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkifyTest1 extends StatelessWidget {
  const LinkifyTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LinkifyTest1'),
        ),
        body: Linkify(
          text: "連結網址為http://www.google.com.tw ,再請嘗試看看",
          style: const TextStyle(
            decoration: TextDecoration.none,
          ),
          options: const LinkifyOptions(
            humanize: true,
            removeWww: true
          ),
          onOpen: handleLinkClick,
        ));
  }

  Future<void> handleLinkClick(LinkableElement link) async {
    final Uri url = Uri.parse(link.url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${link.url}';
    }
  }
}
