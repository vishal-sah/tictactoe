import 'package:flutter/material.dart';
import 'package:tic_tac_toe/recources/socket_methods.dart';
import 'package:tic_tac_toe/responsive/responsive.dart';
import 'package:tic_tac_toe/utilities/colors.dart';
import 'package:tic_tac_toe/widgets/custom_button.dart';
import 'package:tic_tac_toe/widgets/custom_text.dart';
import 'package:tic_tac_toe/widgets/custom_textfield.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  static String routeName = '/create-room';

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
      ),
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  )
                ],
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your name',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onTap: () => _socketMethods.createRoom(_nameController.text),
                text: 'Create',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
