part of '../routes/router_config.dart';

class GithubClientAiChatRoute extends GoRouteData with _$GithubClientAiChatRoute {
  static const String ROUTE_NAME = "/ai_list";

  const GithubClientAiChatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => GithubClientAiChatPage();
}

class GithubClientAiChatPage extends StatelessWidget {
  late final TextEditingController _textEditingController;

  GithubClientAiChatPage({super.key}) {
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeminiApiBloc(),
      child: BlocBuilder<GeminiApiBloc, GeminiApiState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Stack(
              children: [
                Column(children: <Widget>[
                  Expanded(child: chatListWidget(context, state.chatList ?? [])),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: chatInputWidget(context),
                  )
                ]),
                Visibility(
                  visible: state.status == Status.queryLoading,
                  child: const Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  chatListWidget(BuildContext context, List<String> chatList) {
    return ListView.builder(
      reverse: true,
      itemCount: chatList.length, // 假設有20條聊天記錄
      itemBuilder: (context, index) {
        final msg = chatList[index];
        bool isAIReplay = msg.contains("AI reply");

        return ListTile(
          titleAlignment: ListTileTitleAlignment.top,
          leading: CircleAvatar(
            child: Text(isAIReplay ? 'AI' : 'User'), // 可以替換為AI的頭像
          ),
          title: Text(isAIReplay ? 'AI 回答' : '用戶 提示詞'),
          subtitle: MarkdownBody(
            data: msg,
            selectable: true, // 讓文字可以被選取
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              p: const TextStyle(fontSize: 14),
            ),
            onTapLink: (text, href, title) {
              if (href != null) {
                launchUrl(Uri.parse(href)); // 可用 url_launcher 開啟連結
              }
            },
          ),
          onTap: () {
            // 點擊聊天記錄後的處理
            debugPrint('Tapped on AI response $index');
          },
        );
      },
    );
  }

  Widget chatInputWidget(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              hintText: '請輸入您的問題',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {
            // 在此處處理發送按鈕點擊事件
            final query = _textEditingController.text;

            _textEditingController.clear();
            context.read<GeminiApiBloc>().add(QueryEvent(query: query));
          },
        ),
      ],
    );
  }
}
