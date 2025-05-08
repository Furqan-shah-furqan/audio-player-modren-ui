import 'package:add_to_cart/Classes/list_class.dart';
import 'package:add_to_cart/Widgets/menu_button.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Home/menu.dart';

class SongListView extends StatefulWidget {
  final Function(String, String) onSongSelected;
  const SongListView({
    super.key,
    required this.onSongSelected,
  });

  @override
  State<SongListView> createState() => _SongListViewState();
}

class _SongListViewState extends State<SongListView> {
  Color baseColor = const Color.fromARGB(255, 193, 207, 253);
  ListClass listClass = ListClass();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listClass.songList.length,
      itemBuilder: (context, index) {
        bool isPlaying = listClass.songList[index]['isPlaying'];
        return GestureDetector(
          onTap: () {
            Get.to(() => Menu(), transition: Transition.zoom);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              selected: isPlaying,
              selectedTileColor: isPlaying
                  ? const Color.fromARGB(255, 165, 199, 253)
                  : Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: Text(
                listClass.songList[index]['title'],
                style: GoogleFonts.chivo(
                  color: Colors.blueGrey.shade700,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                listClass.songList[index]['title'],
                style: GoogleFonts.chivo(
                  color: Colors.blueGrey.shade500,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: FittedBox(
                child: MyButton(
                  borderRadius: 100.r,
                  color: isPlaying ? Colors.blueAccent[100] : baseColor,
                  heigt: 40,
                  width: 40,
                  icon: isPlaying ? Icons.pause : Icons.play_arrow,
                  iconColor: isPlaying ? Colors.white : Colors.blueGrey,
                  iconSize: 20.r,
                  curveType: isPlaying ? CurveType.concave : CurveType.convex,
                  depth: 30,
                  spread: 7,
                  onTap: () {
                    setState(() {
                      if (listClass.songList[index]['isPlaying']) {
                        // Stop the song if it's currently playing
                        listClass.songList[index]['isPlaying'] = false;
                      } else {
                        // Stop all other songs before playing the selected one
                        for (var song in listClass.songList) {
                          song['isPlaying'] = false;
                        }
                        listClass.songList[index]['isPlaying'] = true;
                        // Call the callback to update the title
                        widget.onSongSelected(
                          listClass.songList[index]['title'],
                          listClass.songList[index]['image'],
                        );
                        // Get.to(() => Menu());
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
