import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_ui/style.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    List<Widget> _buildScreens() {
      return [
        const FirstScreen(),
        const SecondScreen(),
        const FirstScreen(),
        const FirstScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.home_outlined,
            size: 30,
          ),
          title: ("Home"),
          activeColorPrimary: const Color(0xFF757575),
          inactiveColorPrimary: Colors.blueGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.search,
            size: 30,
          ),
          title: ("Search"),
          activeColorPrimary: const Color(0xFF757575),
          inactiveColorPrimary: Colors.blueGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.favorite,
            size: 30,
          ),
          title: ("Favorite"),
          activeColorPrimary: const Color(0xFF757575),
          inactiveColorPrimary: Colors.blueGrey,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.person,
            size: 30,
          ),
          title: ("Account"),
          activeColorPrimary: const Color(0xFF757575),
          inactiveColorPrimary: Colors.blueGrey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: const Color(0xFFE0E0E0),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'HI,MEHRAB',
                      style: greyStyle,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.grey[800],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Enjoy',
                        style: bigBlackTitleStyle,
                      ),
                      Text(
                        'Your Vacation',
                        style: bigBlackTitleStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                              const Text(
                                'Search Destination',
                                style: greyStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 1,
                      child: Card(
                        color: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.menu,
                            color: Colors.grey[700],
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Most Popular',
                          style: blackStyle,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'Mountain',
                      style: greyStyle,
                    ),
                    const Text(
                      'Beach',
                      style: greyStyle,
                    ),
                    const Text(
                      'Forest',
                      style: greyStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset(
                              'img1.jpg',
                              height: 220,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                  Text(
                                    '4.2',
                                    style: blackStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Lombok',
                                  style: whiteTitleStyle,
                                ),
                                Text(
                                  '\$582 night',
                                  style: whiteTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset(
                              'img3.jpg',
                              height: 220,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                  Text(
                                    '4.5',
                                    style: blackStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Karimun Jawa',
                                  style: whiteTitleStyle,
                                ),
                                Text(
                                  '\$582 night',
                                  style: whiteTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Image.asset(
                              'img1.jpg',
                              height: 220,
                              width: 180,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              height: 50,
                              width: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white60,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                  Text(
                                    '4.5',
                                    style: blackStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Karimun Jawa',
                                  style: whiteTitleStyle,
                                ),
                                Text(
                                  '\$582 night',
                                  style: whiteTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Recommended',
                      style: blackStyle,
                    ),
                    Text(
                      'See All',
                      style: greyStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'img2.jpg',
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Nusa Penida',
                                  style: blackTitleStyle,
                                ),
                                const Text(
                                  '\$550 night',
                                  style: blackStyle,
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '4.5',
                        style: blackTitleStyle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'img2.jpg',
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Nusa Penida',
                                  style: bigBlackTitleStyle,
                                ),
                                Text(
                                  'Ball,Indonesia',
                                  style: greyStyle,
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 35,
                                ),
                                Text(
                                  '4.5',
                                  style: blackTitleStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: const [
                            Text(
                              '\$582',
                              style: titleStyle,
                            ),
                            Text(
                              '/night',
                              style: blackStyle2,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'The Maldives is an archipelagic country with nearly 1200 islands formed out of natural atolls. It lies on the Indian Ocean to the south-west of Kerala’s capital, Trivandrum and on the east-west side of Sri Lanka. SriLankan airlines, for instance, operates flights from Colombo that get you to Male in an hour straight.',
                          style: greyDescStyle,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            alignment: Alignment.center,
                            primary: Colors.deepPurpleAccent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 130)),
                        onPressed: () {},
                        child: const Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
