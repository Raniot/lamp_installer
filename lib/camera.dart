import 'package:camera/camera.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_ml_vision/flutter_camera_ml_vision.dart';

class CameraState extends StatefulWidget {
  CameraState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  CameraView createState() => CameraView();
}

class CameraView extends State<CameraState> {
  VisionText _visionText;
  final _scanKey = GlobalKey<CameraMlVisionState>();
  CameraLensDirection cameraLensDirection = CameraLensDirection.back;
  TextRecognizer detector = FirebaseVision.instance.textRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox.expand(
        child: CameraMlVision<VisionText>(
          key: _scanKey,
          cameraLensDirection: cameraLensDirection,
          detector: detector.processImage,
          overlayBuilder: (c) {
            return CustomPaint(
              painter: TextDetectorPainter(
                  _scanKey.currentState.cameraValue.previewSize.flipped, _visionText,
                  reflection: cameraLensDirection == CameraLensDirection.back),
            );
          },
          onResult: (visionText) {
            if (visionText == null || !mounted) {
              return;
            }
            setState(() {
              _visionText = visionText;
            });
          },
          onDispose: () {
            detector.close();
          },
        ),
      ),
    );
  }
}

class TextDetectorPainter extends CustomPainter {
  TextDetectorPainter(this.imageSize, this.visionText, {this.reflection = false});

  final bool reflection;
  final Size imageSize;
  final VisionText visionText;

  Color getColor(String text) {
    if(text == 'M1')
      return Colors.brown;
    if(text == 'N')
      return Colors.blue;
    if(text == 'J')
      return Colors.yellow;
    // else
    //   return Colors.red;
  }

  @override
  void paint(Canvas canvas, Size size) {
    String text = visionText.text;
    for (TextBlock block in visionText.blocks) {
      final Rect boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      final Paint paint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0
        ..color = getColor(text);

      canvas.drawRect(
        _scaleRect(
          rect: _reflectionRect(reflection, boundingBox, imageSize.width),
          imageSize: imageSize,
          widgetSize: size,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(TextDetectorPainter oldDelegate) {
    return oldDelegate.imageSize != imageSize || oldDelegate.visionText != visionText;
  }
}

Rect _reflectionRect(bool reflection, Rect boundingBox, double width) {
  if (!reflection) {
    return boundingBox;
  }
  final centerX = width / 2;
  final left = ((boundingBox.left - centerX) * 1) + centerX;
  final right = ((boundingBox.right - centerX) * 1) + centerX;
  return Rect.fromLTRB(left, boundingBox.top, right, boundingBox.bottom);
}

Rect _scaleRect({
  @required Rect rect,
  @required Size imageSize,
  @required Size widgetSize,
}) {
  final scaleX = widgetSize.width / imageSize.width;
  final scaleY = widgetSize.height / imageSize.height;

  final scaledRect = Rect.fromLTRB(
    rect.left.toDouble() * scaleX,
    rect.top.toDouble() * scaleY,
    rect.right.toDouble() * scaleX,
    rect.bottom.toDouble() * scaleY,
  );
  return scaledRect;
}