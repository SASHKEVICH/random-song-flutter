import 'package:flutter/material.dart';
import 'package:random_song/scenes/onboarding/onboarding_pages/final_onboarding_page.dart';
import 'package:random_song/scenes/onboarding/onboarding_pages/info_onboarding_page.dart';
import 'package:random_song/scenes/onboarding/onboarding_pages/start_onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _activePage = 0;

  final List<Widget> _pages = const [
    StartOnboardingPage(),
    InfoOnboardingPage(),
    FinalOnboardingPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(_pages.length, (index) =>
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      _pageController.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn
                      );
                    },
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: _activePage == index
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                )
              ),
            ),
          ),
        ],
      )
    );
  }
}
