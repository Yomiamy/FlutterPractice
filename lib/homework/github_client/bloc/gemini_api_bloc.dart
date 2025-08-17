import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_practice/homework/github_client/bloc/status.dart';

import 'gemini_api_event.dart';
import 'gemini_api_state.dart';

class GeminiApiBloc extends Bloc<GeminiApiEvent, GeminiApiState> {
  late GenerativeModel _aiModel;
  late ImagenModel _imagenModel;
  late List<String> _chatList;

  GeminiApiBloc() : super(const GeminiApiState()) {
    on<InitEvent>(_init);
    on<QueryEvent>(_query);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<GeminiApiState> emit) async {
    _chatList = [];
    await _initFirebaseAiLogic();

    emit(const GeminiApiState());
  }

  FutureOr<void> _query(QueryEvent event, Emitter<GeminiApiState> emit) async {
    final prompt = event.query;

    _chatList.insert(0, "Prompt: $prompt");
    emit(state.copyWith(status: Status.newPrompt, chatList: _chatList));

    emit(state.copyWith(status: Status.queryLoading));

    /** [Response flow for gemini-2.5-flash & gemini-2.0-flash-preview-image-generation] */
    final response = await _aiModel.generateContent([
      Content.text("$prompt (請用繁體中文回答問題)"),
    ]);

    final parts = response.candidates.firstOrNull?.content.parts ?? [];

    if (parts.isNotEmpty) {
      StringBuffer markdownBuffer = StringBuffer();

      for (final part in parts) {
        if (part is TextPart) {
          markdownBuffer.writeln(part.text);
        } else if (part is InlineDataPart) {
          // Process image
          final imageBytesBase64 = base64Encode(part.bytes);
          markdownBuffer.writeln('![image](data:image/jpeg;base64,$imageBytesBase64)');
        }
      }

      if (markdownBuffer.isNotEmpty) {
        _chatList.insert(0, "AI reply: ${markdownBuffer.toString()}");
      }
    }

    /**
     * [Response flow for imagen-3.0-generate-002]
     * NOTE: Imagen API is only accessible to billed users at this time
     * */

    // final response = await _imagenModel.generateImages("$prompt (請用繁體中文回答問題)");
    //
    // if (response.images.isNotEmpty) {
    //   StringBuffer markdownBuffer = StringBuffer();
    //   final image = response.images[0];
    //
    //   // Process the image
    //   markdownBuffer.writeln('![image](data:image/jpeg;base64,${image.bytesBase64Encoded})');
    //   if (markdownBuffer.isNotEmpty) {
    //     _chatList.insert(0, "AI reply: ${markdownBuffer.toString()}");
    //   }
    // }

    emit(state.copyWith(status: Status.querySuccess, chatList: _chatList));
  }

  Future<void> _initFirebaseAiLogic() async {
    /** [imagen generation model] */
    _imagenModel = FirebaseAI.googleAI().imagenModel(
      model: 'imagen-3.0-generate-002',
    );

    /** [Gemini image generation model] */
    // 不支援systemInstruction
    // _aiModel = FirebaseAI.googleAI().generativeModel(
    //   model: 'gemini-2.0-flash-preview-image-generation',
    //   generationConfig:
    //       GenerationConfig(responseModalities: [ResponseModalities.text, ResponseModalities.image]),
    // );

    /** [Gemini text model] */
    // _aiModel = FirebaseAI.googleAI().generativeModel(
    //   model: 'gemini-2.5-flash',
    //   systemInstruction: Content.system("以繁體中文回答問題"),
    // );

    // Provide a prompt that contains text
    // const prompt = '以Dart寫一個Hello World程式';
    // const prompt = "請用中文描述這個影片的內容?";
    // final promptTextPart = TextPart("請用中文描述這個影片的內容?");

    /** [Prepare video & text for input] */
    // ByteData videoBytes = await rootBundle.load(AssetVideoRes.animals);
    // Provide the video as `Data` with the appropriate mimetype
    // final videoPart = InlineDataPart('video/mp4', videoBytes.buffer.asUint8List());

    // To generate text output, call generateContent with the text input
    // final response = await model.generateContent([Content.text(prompt)]);
    // final response = await model.generateContent([
    //   Content.multi([promptTextPart, videoPart])
    // ]);
    // final response = await model.generateContent(
    //     [Content.text(prompt), Content.inlineData('video/mp4', videoBytes.buffer.asUint8List())]);
    // debugPrint("Gemini Response:\n${response.text}");

    // To generate a stream of text output, call generateContentStream with the text input
    // final response = model.generateContentStream(
    //     [Content.text(prompt), Content.inlineData('video/mp4', videoBytes.buffer.asUint8List())]);
    // await for (final chunk in response) {
    //   debugPrint(chunk.text);
    // }

    /** [Prepare image for input] */
    // ByteData imageBytes = await rootBundle.load(AssetImageRes.animalPic1.path);
    // // Provide the video as `Data` with the appropriate mimetype
    // final imageDatas = imageBytes.buffer.asUint8List();
    //
    // final response = await _aiModel.generateContent([
    //   Content.text(prompt),
    //   Content.inlineData('image/jpeg', imageDatas),
    // ]);
  }
}
