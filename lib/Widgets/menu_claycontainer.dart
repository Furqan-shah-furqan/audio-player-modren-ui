import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MenuClaycontainer extends StatelessWidget {
  MenuClaycontainer({super.key});
  Color baseColor = Color.fromARGB(255, 193, 207, 253);

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      height: 50.r,
      width: 50.r,
      borderRadius: 100,
      color: baseColor,
      curveType: CurveType.convex,
      depth: 30,
      spread: 7,
      child: PopupMenuButton<String>(
        icon: Icon(Icons.menu), // Menu icon
        color: Colors.transparent,
        elevation: 0,
        popUpAnimationStyle: AnimationStyle(curve: Curves.bounceIn),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'One',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '',
                  style: GoogleFonts.chivo(
                      color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Two',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Two',
                  style: GoogleFonts.chivo(
                      color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'Three',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Three',
                  style: GoogleFonts.chivo(
                      color: Colors.blueGrey, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
