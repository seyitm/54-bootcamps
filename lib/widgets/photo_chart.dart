import 'package:antello/themes/app_colors.dart';
import 'package:flutter/material.dart';

class PhotoChart extends StatefulWidget {
  const PhotoChart({ Key? key }) : super(key: key);

  @override
  State<PhotoChart> createState() => _PhotoChartState();
}

class _PhotoChartState extends State<PhotoChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 100),
      child: Stack(children: [
       Container(height: 100, width: 100, decoration: BoxDecoration( color: AppColors.purple,  borderRadius: BorderRadius.circular(100)),child: Padding(padding: EdgeInsets.all(1), child: Container(height: 50, width: 50, decoration: BoxDecoration( color: Colors.white,  borderRadius: BorderRadius.circular(100))), ),)
,
        Container(child: Icon(Icons.person),),
      ],alignment: Alignment.center,),
    );
  }
}


class SideArrowClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double startMargin = size.width / 2;
    final double s1 = size.height * 0.5;
    final double s2 = size.height * 0.6;
    print('S1:$s1 SH:${size.height / 2} S2:$s2');
    path.lineTo(startMargin, 0);
     path.lineTo(startMargin, s1);
     path.lineTo(s1, size.height);
    // path.lineTo(0, size.height / 2);
    // path.lineTo(startMargin, s2);
    // path.lineTo(startMargin, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}