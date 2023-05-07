import 'dart:convert';

import 'package:get_server/get_server.dart';

class SocketPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return Socket(builder: (socket) {
      socket.onOpen((ws) {
        ws.send('socket ${ws.id} connected');
      });

      socket.on('join', (val) {
        final join = socket.join(val);
        if (join) {
          socket.sendToRoom(val, 'socket: ${socket.hashCode} join to room');
        }
      });
      socket.onMessage((data) {
        print('data:**==>> $data');

        // String receivedDataJsonString = jsonDecode(data)['data']; // 受信したJSON文字列

        List<MyConstructor> myDataList = [];

        try {
          String receivedDataJsonString =
              jsonDecode(data)['data']; // 受信したJSON文字列
          List<Map<String, dynamic>> dataDecode =
              jsonDecode(receivedDataJsonString).cast<Map<String, dynamic>>();

          myDataList = dataDecode.map((e) => MyConstructor.fromMap(e)).toList();
        } catch (e) {
          // 変換エラーが発生した場合の処理
          print('JSON変換エラー: $e');
        }
        myDataList.forEach((element) {
          print('${element.strNm} : ${element.intPrice}');
        });

        socket.send('Server>>>>>$data');
      });

      socket.onClose((close) {
        print('socket has closed. Reason: ${close.message}');
      });
    });
  }
}

class MyConstructor {
  final String strNm;
  final int intPrice;

  MyConstructor({required this.strNm, required this.intPrice});

  factory MyConstructor.fromMap(Map<String, dynamic> map) => MyConstructor(
        strNm: map['strNm'],
        intPrice: map['intPrice'],
      );

  Map<String, dynamic> toMap() => {
        'strNm': strNm,
        'intPrice': intPrice,
      };
}
