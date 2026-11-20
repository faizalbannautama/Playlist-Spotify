import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ======================================
// 1. STATELESS WIDGET
// ======================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MusicPage(),
    );
  }
}

// ======================================
// 2. MODEL DATA LAGU
// ======================================

class Song {
  final String title;
  final String artist;
  final String listeners;
  final String image;

  const Song({
    required this.title,
    required this.artist,
    required this.listeners,
    required this.image,
  });
}

// ======================================
// 3. STATEFUL WIDGET
// ======================================

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  // ======================================
  // 4. DATA 20 LAGU
  // ======================================

  final List<Song> songs = [
    Song(
      title: "everything u are",
      artist: "Hindia",
      listeners: "531.296.829",
      image: "https://picsum.photos/seed/music1/200",
    ),
    Song(
      title: "Rumah Ke Rumah",
      artist: "Hindia",
      listeners: "811.643.765",
      image: "https://picsum.photos/seed/music2/200",
    ),
    Song(
      title: "Cincin",
      artist: "Hindia",
      listeners: "568.621.437",
      image: "https://picsum.photos/seed/music3/200",
    ),
    Song(
      title: "Evaluasi",
      artist: "Hindia",
      listeners: "598.662.134",
      image: "https://picsum.photos/seed/music4/200",
    ),
    Song(
      title: "Kita Ke Sana",
      artist: "Hindia",
      listeners: "263.844.416",
      image: "https://picsum.photos/seed/music5/200",
    ),
    Song(
      title: "Secukupnya",
      artist: "Hindia",
      listeners: "505.418.495",
      image: "https://picsum.photos/seed/music6/200",
    ),
    Song(
      title: "Membasuh",
      artist: "Hindia",
      listeners: "272.491.045",
      image: "https://picsum.photos/seed/music7/200",
    ),
    Song(
      title: "Berdansalah, Karir Ini Tak Ada Artinya",
      artist: "Hindia",
      listeners: "182.831.272",
      image: "https://picsum.photos/seed/music8/200",
    ),
    Song(
      title: "Evakuasi",
      artist: "Hindia",
      listeners: "156.285.803",
      image: "https://picsum.photos/seed/music9/200",
    ),
    Song(
      title: "Ramai Sepi Bersama",
      artist: "Hindia",
      listeners: "99.783.841",
      image: "https://picsum.photos/seed/music10/200",
    ),
    Song(
      title: "Untuk Perempuan",
      artist: "Payung Teduh",
      listeners: "87.542.120",
      image: "https://picsum.photos/seed/music11/200",
    ),
    Song(
      title: "Hati-Hati di Jalan",
      artist: "Tulus",
      listeners: "76.321.450",
      image: "https://picsum.photos/seed/music12/200",
    ),
    Song(
      title: "Monokrom",
      artist: "Tulus",
      listeners: "65.432.100",
      image: "https://picsum.photos/seed/music13/200",
    ),
    Song(
      title: "Pilu Membiru",
      artist: "Kunto Aji",
      listeners: "54.321.987",
      image: "https://picsum.photos/seed/music14/200",
    ),
    Song(
      title: "Rehat",
      artist: "Kunto Aji",
      listeners: "43.210.876",
      image: "https://picsum.photos/seed/music15/200",
    ),
    Song(
      title: "Bertaut",
      artist: "Nadin Amizah",
      listeners: "32.109.765",
      image: "https://picsum.photos/seed/music16/200",
    ),
    Song(
      title: "Sorai",
      artist: "Nadin Amizah",
      listeners: "21.987.654",
      image: "https://picsum.photos/seed/music17/200",
    ),
    Song(
      title: "Dunia Tipu-Tipu",
      artist: "Yura Yunita",
      listeners: "19.876.543",
      image: "https://picsum.photos/seed/music18/200",
    ),
    Song(
      title: "Satu Bulan",
      artist: "Bernadya",
      listeners: "15.765.432",
      image: "https://picsum.photos/seed/music19/200",
    ),
    Song(
      title: "Kembali Pulang",
      artist: "Suara Kayu",
      listeners: "12.654.321",
      image: "https://picsum.photos/seed/music20/200",
    ),
  ];

  // ======================================
  // 5. STATUS TOMBOL CENTANG
  // ======================================

  late List<bool> checked;

  @override
  void initState() {
    super.initState();

    checked = List<bool>.filled(songs.length, true);
  }

  // ======================================
  // 6. TAMPILAN UTAMA
  // ======================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // JUDUL APLIKASI
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Daftar Lagu Populer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // ======================================
            // 7. LISTVIEW
            // ======================================
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,

                itemBuilder: (context, index) {
                  return SongItem(
                    number: index + 1,
                    song: songs[index],
                    isChecked: checked[index],

                    onCheck: () {
                      setState(() {
                        checked[index] = !checked[index];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================
// 8. STATELESS WIDGET ITEM LAGU
// ======================================

class SongItem extends StatelessWidget {
  final int number;
  final Song song;
  final bool isChecked;
  final VoidCallback onCheck;

  const SongItem({
    super.key,
    required this.number,
    required this.song,
    required this.isChecked,
    required this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    // ======================================
    // 9. LISTTILE
    // ======================================

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),

      // NOMOR DAN GAMBAR ALBUM
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 30,
            child: Text(
              "$number",
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),

          const SizedBox(width: 10),

          // ======================================
          // 10. IMAGE
          // ======================================
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              song.image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,

              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 70,
                  height: 70,
                  color: Colors.grey,
                  child: const Icon(Icons.music_note, color: Colors.white),
                );
              },
            ),
          ),
        ],
      ),

      // JUDUL LAGU
      title: Text(
        song.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),

      // NAMA PENYANYI DAN JUMLAH PEMUTARAN
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            song.artist,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),

          const SizedBox(height: 3),

          Text(
            "${song.listeners} kali diputar",
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ],
      ),

      // TOMBOL CENTANG DAN MENU
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onCheck,
            icon: Icon(
              isChecked ? Icons.check_circle : Icons.check_circle_outline,
              color: isChecked ? const Color(0xFF1ED760) : Colors.grey,
              size: 30,
            ),
          ),

          const Icon(Icons.more_vert, color: Colors.grey, size: 28),
        ],
      ),
    );
  }
}
