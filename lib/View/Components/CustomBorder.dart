import '../../Support/Export/MyExport.dart';

class CustomBorder extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = const Color(0XFFD9ECA7);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 9;

    var path = Path();

    path.moveTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.moveTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}