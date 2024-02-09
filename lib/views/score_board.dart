import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/provider/room_data_provider.dart';
import 'package:tic_tac_toe/widgets/custom_padding.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomPadding(
          nickname: roomDataProvider.player1.nickname,
          points: roomDataProvider.player1.points.toInt().toString(),
        ),
        CustomPadding(
          nickname: roomDataProvider.player2.nickname,
          points: roomDataProvider.player2.points.toInt().toString(),
        ),
      ],
    );
  }
}
