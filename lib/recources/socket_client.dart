import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tic_tac_toe/credentials/my_ip.dart';

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io(myIp, <String, dynamic>{
      'transports': ['websocket'],
      'autoconnect': false,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
