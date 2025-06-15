/**
 * 檔案：/lib/tab/request_favor_page.dart
 *
 * 功能：此檔案定義了一個請求幫忙的頁面 (RequestFavorPage)。
 *
 * 它允許使用者：
 * - 從朋友列表中選擇一位朋友。
 * - 描述請求的內容。
 * - 設定請求的截止日期和時間。
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_practice/tab/favors_page.dart';
import 'package:intl/intl.dart';
import 'friend.dart';

class RequestFavorPage extends StatefulWidget {
  final List<Friend> friends;

  const RequestFavorPage({super.key, required this.friends});

  @override
  RequestFavorPageState createState() {
    return new RequestFavorPageState();
  }
}

class RequestFavorPageState extends State<RequestFavorPage> {
  final _formKey = GlobalKey<FormState>();
  Friend? _selectedFriend;
  final TextEditingController _dateTimeController = TextEditingController();
  DateTime? _selectedDateTime;

  static RequestFavorPageState? of(BuildContext context) {
    return context.findAncestorStateOfType<RequestFavorPageState>();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: FavorsPage.FAVORS_PAGE_HERO_TAG,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Requesting a favor"),
            leading: const CloseButton(),
            actions: <Widget>[
              Builder(
                builder: (context) => ElevatedButton(
                  child: const Text("SAVE", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    RequestFavorPageState.of(context)?.save();
                  },
                ),
              ),
            ],
          ), // AppBar
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DropdownButtonFormField<Friend>(
                      value: _selectedFriend,
                      onChanged: (friend) {
                        setState(() {
                          _selectedFriend = friend;
                        });
                      },
                      items: widget.friends
                          .map(
                            (f) => DropdownMenuItem<Friend>(
                          value: f,
                          child: Text(f.name),
                        ),
                      )
                          .toList(),
                      validator: (friend) {
                        if (friend == null) {
                          return "You must select a friend to ask the favor";
                        }
                        return null;
                      },
                    ),
                    Container(
                      height: 16.0,
                    ),
                    const Text("Favor description:"),
                    TextFormField(
                      maxLines: 5,
                      inputFormatters: [LengthLimitingTextInputFormatter(200)],
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "You must detail the favor";
                        }
                        return null;
                      },
                    ),
                    Container(
                      height: 16.0,
                    ),


                    const Text("Due Date:"),

                    TextFormField(
                      controller: _dateTimeController,
                      readOnly: true,
                      onTap: () => _selectDateTime(context),
                      decoration: const InputDecoration(
                        labelText: 'Date/Time',
                      ),
                      validator: (value) {
                        if (_selectedDateTime == null) {
                          return "You must select a due date time for the favor";
                        }
                        return null;
                      }
                    )
                  ]
                )
              )
            )
          )
        )
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedTime == null) return;

    final DateTime combined = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      _selectedDateTime = combined;
      _dateTimeController.text = DateFormat("yyyy-MM-dd HH:mm").format(combined);
    });
  }

  void save() {
    if (_formKey.currentState?.validate() ?? false) {
      // store the favor request on firebase
      Navigator.pop(context);
    }
  }
}
