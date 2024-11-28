import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'dart:developer';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (!await FlutterOverlayWindow.isPermissionGranted()) {
      await FlutterOverlayWindow.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Floating Chat Head"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                if (await FlutterOverlayWindow.isActive()) return;

                // Show the overlay on the left side (inside the screen boundaries)
                await FlutterOverlayWindow.showOverlay(
                  enableDrag: true,
                  overlayTitle: "Md Abdullah Al Siddik",
                  overlayContent: "Hi, How are you?",
                  alignment: OverlayAlignment.topRight,
                  flag: OverlayFlag.defaultFlag,
                  visibility: NotificationVisibility.visibilityPublic,
                  positionGravity:
                      PositionGravity.left, 
                  height: 100,
                  width: 100,
                );

            
                FlutterOverlayWindow.moveOverlay(
                  OverlayPosition(
                      0.0, screenWidth), 
                );
              },
              child: const Text("Show Chat Head Left"),
            ),
            const SizedBox(height: 20),
          
            ElevatedButton(
              onPressed: () async {
                final isActive = await FlutterOverlayWindow.isActive();
                log("Is Overlay Active: $isActive");
              },
              child: const Text("Check Overlay Active"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await FlutterOverlayWindow.closeOverlay();
                log("Overlay Closed");
              },
              child: const Text("Close Chat Head"),
            ),
          ],
        ),
      ),
    );
  }
}
