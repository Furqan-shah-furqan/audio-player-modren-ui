import 'package:add_to_cart/Widgets/song_listVeiw.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Classes/list_class.dart';
import '../Widgets/menu_button.dart';

// ignore: must_be_immutable
class SongListPage extends StatefulWidget {
  const SongListPage({super.key});

  @override
  State<SongListPage> createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  Color baseColor = Color.fromARGB(255, 193, 207, 253);
  bool changeFavorite = false;
  String selectedTitle = ListClass().songList[0]['title']; // Default title
  String selectedImage = ListClass().songList[3]['image']; // Default title

  chageFav() {
    setState(() {
      changeFavorite = !changeFavorite;
    });
  }

  void playSong(int index) {
    setState(() {
      for (int i = 0; i < ListClass().songList.length; i++) {
        ListClass().songList[i]['isPlaying'] =
            (i == index) ? !ListClass().songList[i]['isPlaying'] : false;
      }
    });
  }

  // Function to update title and image when a song is played
  void updateSongDetails(String newTitle, String newImage) {
    setState(() {
      selectedTitle = newTitle;
      selectedImage = newImage;
    });
  }

  void updateImageTitle(String newImage) {
    setState(() {
      selectedImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Center(
              child: Text(
                selectedTitle,
                style: GoogleFonts.lobster(
                    fontSize: 20.sp, color: Colors.blueGrey),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Faviorite Button
              MyButton(
                borderRadius: 100.r,
                color: baseColor,
                heigt: 60.r,
                width: 60.r,
                icon: Icons.favorite,
                iconColor: changeFavorite ? Colors.red[300] : Colors.blueGrey,
                curveType: CurveType.convex,
                depth: 30,
                spread: 7,
                iconSize: 22.sp,
                onTap: chageFav,
              ),
              ClayContainer(
                  height: 180.r,
                  width: 180.r,
                  color: baseColor,
                  depth: 40,
                  spread: 10,
                  curveType: CurveType.convex,
                  customBorderRadius: BorderRadius.circular(200.r),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(selectedImage),
                    ),
                  )),
              // Menu Button
              MyButton(
                borderRadius: 100.r,
                color: baseColor,
                heigt: 60.r,
                width: 60.r,
                icon: Icons.more_horiz,
                iconColor: Colors.blueGrey,
                curveType: CurveType.convex,
                depth: 30,
                spread: 7,
                iconSize: 22.sp,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          SongListView(
            onSongSelected: updateSongDetails,
          ),
        ],
      ),
    );
  }
}
