import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedCardPage extends StatefulWidget {
  const AnimatedCardPage({Key? key}) : super(key: key);

  @override
  createState() => _AnimatedCardPageState();
}

class _AnimatedCardPageState extends State<AnimatedCardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  // bool _isActive = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    var screenWidth = window.physicalSize.shortestSide;

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween(begin: 1.0, end: 11.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            children: [
              // AnimatedCard(
              //   activeColor: Color.fromRGBO(14, 165, 233, 1.0),
              //   inactiveColor: Color.fromRGBO(56, 189, 248, 1.0),
              // ),
              // SizedBox(height: 30),
              AnimatedCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({super.key});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isActive = false;

  final Color activeColor = Colors.orange;
  final Color inactiveColor = Colors.orangeAccent;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween(begin: 1.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.slowMiddle),
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
          setState(() {
            _isActive = false;
          });
        } else {
          _controller.forward();
          setState(() {
            _isActive = true;
          });
        }
      },
      child: SizedBox(
        width: double.maxFinite,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: activeColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isActive ? inactiveColor : activeColor,
                        ),
                        child: const Icon(
                          Icons.message,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "HAR HAR MAHADEV",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: _isActive ? Colors.white : Colors.black,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Learn More',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: _isActive ? Colors.white : Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
