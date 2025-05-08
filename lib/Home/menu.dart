import 'package:add_to_cart/Classes/list_class.dart';
import 'package:add_to_cart/Widgets/menu_button.dart';
import 'package:add_to_cart/Widgets/menu_claycontainer.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Color baseColor = Color.fromARGB(255, 193, 207, 253);
  bool changeplayIcon = false;
  int currentIndex = 0; // Track current song index

  chagePlayIcon() {
    setState(() {
      changeplayIcon = !changeplayIcon;
    });
  }

  void changeNextPlayIcon() {
    setState(() {
      if (currentIndex < listClass.songList.length - 1) {
        currentIndex++; // Move to next song
      } else {
        currentIndex = 0; // Reset to first song if last song reached
      }
    });
  }

  void changePreviousPlayIcon() {
    setState(() {
      currentIndex = (currentIndex - 1 + listClass.songList.length) %
          listClass.songList.length;
    });
  }

  ListClass listClass = ListClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // back Button
                  MyButton(
                    borderRadius: 100.r,
                    color: baseColor,
                    heigt: 50.r,
                    width: 50.r,
                    icon: Icons.arrow_back,
                    curveType: CurveType.convex,
                    depth: 30,
                    spread: 7,
                    onTap: () => Navigator.pop(context),
                  ),
                  // PLAYING NOW
                  Text('PLAYING NOW',
                      style: GoogleFonts.chivo(
                          color: Colors.blueGrey,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600)),
                  // menu Button
                  MenuClaycontainer()
                ],
              ),
              // Home Body
              Center(
                child: ClayContainer(
                    height: 260.r,
                    width: 260.r,
                    color: baseColor,
                    depth: 40,
                    spread: 10,
                    curveType: CurveType.convex,
                    customBorderRadius: BorderRadius.circular(200.r),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          listClass.songList[currentIndex]['image'],
                        ),
                      ),
                    )),
              ),

              // Lose It
              Column(
                children: [
                  Text(
                    listClass.songList[currentIndex]['title'],
                    style: GoogleFonts.lobster(
                        fontSize: 33.sp, color: Colors.blueGrey[800]),
                  ),
                  // descr
                  Text(
                    listClass.songList[currentIndex]['artist'],
                    style: GoogleFonts.lobster(
                        fontSize: 20.sp, color: Colors.blueGrey),
                  ),
                ],
              ),
              //  Slider
              Slider(
                min: 0,
                max: 20,
                value: 0,
                activeColor: Colors.blueAccent[100],
                thumbColor: const Color.fromARGB(255, 118, 171, 255),
                onChanged: (value) async {},
              ),

              // Previous || Pause || Next Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Previous.
                  GestureDetector(
                    onTap: changePreviousPlayIcon,
                    child: MyButton(
                      borderRadius: 100.r,
                      color: baseColor,
                      heigt: 60.r,
                      width: 60.r,
                      icon: Icons.skip_previous_rounded,
                      curveType: CurveType.convex,
                      depth: 30,
                      spread: 7,
                    ),
                  ),
                  // Pause
                  GestureDetector(
                    onTap: chagePlayIcon,
                    child: MyButton(
                      borderRadius: 200.r,
                      color:
                          changeplayIcon ? Colors.blueAccent[100] : baseColor,
                      iconColor: Colors.white,
                      heigt: 70.r,
                      width: 70.r,
                      icon: changeplayIcon ? Icons.pause : Icons.play_arrow,
                      curveType:
                          changeplayIcon ? CurveType.concave : CurveType.convex,
                      depth: 30,
                      spread: 7,
                    ),
                  ),
                  // Next
                  GestureDetector(
                    onTap: changeNextPlayIcon,
                    child: MyButton(
                      borderRadius: 100.r,
                      color: baseColor,
                      heigt: 60.r,
                      width: 60.r,
                      icon: Icons.skip_next_rounded,
                      iconColor: Colors.black,
                      curveType: CurveType.convex,
                      depth: 30,
                      spread: 7,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
