import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Practice4 extends StatefulWidget {
  const Practice4({super.key});

  @override
  State<Practice4> createState() => _Practice4State();
}

class _Practice4State extends State<Practice4> {
  SizedBox get spacer {
    return const SizedBox(
      height: 20,
    );
  }

  SizedBox get hSpacer {
    return const SizedBox(
      width: 20,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Practice4"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    backgroundImage: AssetImageRes.happylight.provider(),
                  ),
                ),
                spacer,
                const Text("Randy",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                spacer,
                const Text(
                  "軟體工程師",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                spacer,
                RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                      style: TextStyle(
                          color: Color.fromARGB(221, 91, 91, 91), fontSize: 16),
                      children: [
                        TextSpan(
                            text: "專長領域\n",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                          text: "Mobile App 開發\n",
                        ),
                        TextSpan(
                          text: "Flutter / iOS / Android\n",
                        )
                      ]),
                ),
                spacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 36,
                        onPressed: () {
                          showGitHub();
                        },
                        icon: const Icon(Icons.public)),
                    hSpacer,
                    IconButton(
                        iconSize: 36,
                        onPressed: () {
                          showMyPortfoilo();
                        },
                        icon: const Icon(Icons.terminal))
                  ],
                )
              ],
            ),
          ),
        ),
      );

  void showGitHub() async {
    final Uri gitHub = Uri.parse("https://www.google.com"); // 使用 Uri
    if (await canLaunchUrl(gitHub)) {
      await launchUrl(gitHub);
    } else {
      throw 'Could not launch $gitHub';
    }
  }

  void showMyPortfoilo() async {
    var url = Uri.parse("https://www.google.com/");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
