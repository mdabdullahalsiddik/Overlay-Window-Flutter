import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class MessengerChatHead extends StatelessWidget {
  const MessengerChatHead({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: () {
            FlutterOverlayWindow.closeOverlay();
          },
          onPanUpdate: (details) {
            // Allow drag movement of the overlay window
            // FlutterOverlayWindow.moveOverlay(
            //   OverlayPosition(
            //       0.0, screenHeight / 2 - 50), // Left side, centered vertically
            // );
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.message,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
