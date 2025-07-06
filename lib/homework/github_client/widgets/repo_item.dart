import 'package:flutter/material.dart';

import '../../../gen/assets_config.dart';
import '../models/repo.dart';
import 'github_client_repository_detail_page.dart';

class RepoItem extends StatefulWidget {
  final Repo repo;

  const RepoItem({super.key, required this.repo});

  @override
  State<RepoItem> createState() => _RepoItemState();
}

class _RepoItemState extends State<RepoItem> {
  String subTitle = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
      child: GestureDetector(
        onTap: () {
          // final Uri url = Uri.parse(widget.repo.htmlUrl ?? "");
          //
          // canLaunchUrl(url).then((isCanLaunch) async {
          //   if (!isCanLaunch) {
          //     Toast.show("${widget.repo.htmlUrl} can't opened");
          //   } else {
          //     launchUrl(url, mode: LaunchMode.externalApplication);
          //   }
          // });

          RepositoryDetailRoute().push(context);
        },
        child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(children: <Widget>[
              ListTile(
                  dense: true,
                  leading: CircleAvatar(
                    backgroundImage: AssetImageRes.animalPic9.fileProvider,
                    radius: 20.0,
                  ),
                  title: Text("Name: ${widget.repo.fullName ?? "No Name"}",
                      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  subtitle: Text("Url: ${widget.repo.htmlUrl ?? "No URL"}",
                      style: const TextStyle(fontSize: 14.0),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis)),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(widget.repo.description ?? "No Description",
                      style: const TextStyle(fontSize: 14.0, color: Colors.grey),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis)),
              _buildBottom()
            ])),
      ),
    );
  }

  Widget _buildBottom() {
    return IconTheme(
        data: const IconThemeData(color: Colors.grey, size: 15),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.grey, fontSize: 12),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
            child: Builder(builder: (context) {
              var children = <Widget>[
                const Icon(Icons.star),
                Text(" ${widget.repo.stargazersCount.toString().padRight(6)}"),
                const Icon(Icons.info_outline),
                Text(" ${widget.repo.openIssuesCount.toString().padRight(6)}"),
                const Icon(Icons.copy),
                Text(" ${widget.repo.forksCount.toString().padRight(6)}")
              ];

              if (widget.repo.private == true) {
                children.addAll(<Widget>[const Icon(Icons.lock), Text(" private".padRight(6))]);
              }

              return Row(children: children);
            }),
          ),
        ));
  }
}
