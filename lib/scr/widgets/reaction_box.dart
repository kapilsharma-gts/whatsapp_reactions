import 'package:flutter/material.dart';
import 'package:whatsapp_reactions/scr/widgets/reaction_page.dart';
import '../models/emotions.dart';
import '../models/reaction_box_paramenters.dart';

class ReactionBox extends StatefulWidget {
  final List<Emotions> emotions;
  final Function(Emotions) handlePressed;
  final ReactionBoxParamenters boxParamenters;
  final Emotions? emotionPicked;
  const ReactionBox({
    Key? key,
    required this.emotions,
    required this.handlePressed,
    required this.boxParamenters,
    required this.emotionPicked,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReactionBoxState();
}

class _ReactionBoxState extends State<ReactionBox>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  final List<List<Emotions>> _emotions = [];
  int _currentIndex = 0;

  // Add animation-related variables.
  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);

    List<Emotions> temp = [];
    for (Emotions emotion in widget.emotions) {
      temp.add(emotion);
      if (temp.length == widget.boxParamenters.quantityPerPage) {
        _emotions.add(temp);
        temp = [];
      }
    }

    if (temp.isNotEmpty) {
      _emotions.add(temp);
    }

    // Initialize the animation controller and set up the animation.
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _scaleAnimationController, curve: Curves.easeInOut),
    );

    // Start the animation when the widget is first built.
    _scaleAnimationController.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is disposed.
    _scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation
              .value, // Apply the scale transformation based on the animation value.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: widget.boxParamenters.iconSize +
                    widget.boxParamenters.iconSpacing * 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(widget.boxParamenters.radiusBox),
                  color: Colors.transparent,
                ),
                alignment: Alignment.center,
                child: PageView(
                  onPageChanged: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  children: _emotions
                      .map<Widget>(
                        (page) => ReactionPage(
                          emotions: page,
                          handlePressed: widget.handlePressed,
                          boxParamenters: widget.boxParamenters,
                          emotionPicked: widget.emotionPicked,
                        ),
                      )
                      .toList(),
                ),
              ),
              Visibility(
                visible: _emotions.length > 1,
                child: SizedBox(
                  height: 10.0,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _emotions.length,
                    itemBuilder: ((context, index) {
                      final bool isCurrent = index == _currentIndex;
                      return Container(
                        margin: const EdgeInsets.only(right: 4),
                        height: isCurrent ? 6 : 4,
                        width: isCurrent ? 6 : 4,
                        decoration: BoxDecoration(
                          color: isCurrent ? Colors.grey : Colors.grey.shade400,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
