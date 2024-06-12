import "package:flutter/material.dart";
import "favourites_screen.dart";
import "search_screen.dart";
import "app_gallery2.dart";
import "cart_screen.dart";
import "profile_screen.dart";
import "play_music.dart";

class BottomNavigationApp extends StatefulWidget {
  const BottomNavigationApp({super.key});

  @override
  State createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State {
  int currentIndex = 0;

  final listOfScreens = const [
    //FavouritesScreen(),
    PlayMusic(),
    SearchScreen(),
    AppGalleryScreen(),
    CartScreen(),
    ProfileScreen(),

  ];
  void onTapIcon(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfScreens[currentIndex],
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(19, 19, 19, 1),
        padding: const EdgeInsets.only(bottom: 5),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          onTap: onTapIcon,
          currentIndex: currentIndex,
          backgroundColor: const Color.fromRGBO(19, 19, 19, 1),
          unselectedItemColor: Colors.white,
          selectedItemColor: const Color.fromRGBO(230, 154, 21, 1),
          items: [
            BottomNavigationBarItem(
              icon: (currentIndex == 0)
                  ? const Icon(
                      Icons.favorite,
                      size: 22,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      size: 22,
                    ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: (currentIndex == 1)
                  ? const Icon(
                      Icons.search,
                      size: 22,
                    )
                  : const Icon(
                      Icons.search_outlined,
                      size: 22,
                    ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: (currentIndex == 2)
                  ? const Icon(
                      Icons.home,
                      size: 22,
                    )
                  : const Icon(
                      Icons.home_outlined,
                      size: 22,
                    ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: (currentIndex == 3)
                  ? const Icon(
                      Icons.shopping_basket,
                      size: 22,
                    )
                  : const Icon(
                      Icons.shopping_basket_outlined,
                      size: 22,
                    ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: (currentIndex == 4)
                  ? const Icon(
                      Icons.person_2,
                      size: 22,
                    )
                  : const Icon(
                      Icons.person_outline,
                      size: 22,
                    ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
