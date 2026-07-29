/*
 * 這個檔案包含了應用程式中用於測試和展示的模擬資料。
 * 這些資料包括待處理的人情、正在進行的人情、已完成的人情、已拒絕的人情以及朋友列表。
 */


import 'package:uuid/uuid.dart';

import 'favor.dart';
import 'friend.dart';

const uuid = Uuid();

final mockPendingFavors = [
  Favor(
    uuid: uuid.v4(),
    description: "go to the supermarket",
    dueDate: DateTime.now().add(const Duration(days: 1)),
    friend: Friend(
      name: "My cat",
      number: "11111111111",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  ),
  Favor(
    uuid: uuid.v4(),
    description: "call mom",
    dueDate: DateTime.now().add(const Duration(hours: 5)),
    friend: Friend(
      name: "Wife",
      number: "9292992929",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  ),
  Favor(
    uuid: uuid.v4(),
    description: "go to the supermarket now!",
    dueDate: DateTime.now(),
    friend: Friend(
      name: "My cat",
      number: "11111111111",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  ),
  Favor(
    uuid: uuid.v4(),
    description: "go to the supermarket now!",
    dueDate: DateTime.now(),
    friend: Friend(
      name: "My cat",
      number: "11111111111",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  ),
];

// accepted favors
final mockDoingFavors = [
  Favor(
    uuid: uuid.v4(),
    description: "eat a watermelon",
    dueDate: DateTime.now().add(const Duration(days: 1)),
    accepted: true,
    friend: Friend(
      name: "Dude 1",
      number: "99999999900",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  ),
  Favor(
    uuid: uuid.v4(),
    description: "cut the grass",
    dueDate: DateTime.now().add(const Duration(hours: 1)),
    accepted: true,
    friend: Friend(
      name: "Dad",
      number: "99999999999",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  )
];

// completed favors
final mockCompletedFavors = [
  Favor(
    uuid: uuid.v4(),
    description: "make the dinner",
    dueDate: DateTime.now().add(const Duration(days: 1)),
    completed: DateTime.now(),
    accepted: true,
    friend: Friend(
      name: "Mom",
      number: "99999999991",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  ),
];

// refused favors
final mockRefusedFavors = [
  Favor(
    uuid: uuid.v4(),
    description: "find a job",
    dueDate: DateTime.now().add(const Duration(days: 1)),
    accepted: false,
    friend: Friend(
      name: "Dad",
      number: "99999999999",
      photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
    ),
  ),
];

final mockFriends = [
  Friend(
    name: "My cat",
    number: "11111111111",
    photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
  ),
  Friend(
    name: "Mom",
    number: "99999999991",
    photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
  ),
  Friend(
    name: "Dad",
    number: "99999999999",
    photoURL: "https://images.squarespace-cdn.com/content/v1/54822a56e4b0b30bd821480c/45ed8ecf-0bb2-4e34-8fcf-624db47c43c8/Golden+Retrievers+dans+pet+care.jpeg",
  ),
];