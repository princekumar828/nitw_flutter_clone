import 'package:flutter/material.dart';

class NoticeMarquee extends StatefulWidget {
  final List<String> notices; // List of notices
  final Duration scrollDuration; // Scroll speed duration
  final String newTagText; // Text for the new tag

  const NoticeMarquee({
    Key? key,
    required this.notices,
    this.scrollDuration = const Duration(seconds: 10), // Default speed
    this.newTagText = "New!", // Default "New" tag text
  }) : super(key: key);

  @override
  _NoticeMarqueeState createState() => _NoticeMarqueeState();
}

class _NoticeMarqueeState extends State<NoticeMarquee> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController; // Controller for scrolling
  late double _scrollPosition;
  late double _screenWidth;

  @override
  void initState() {
    super.initState();
    _scrollPosition = 0.0;
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling(); // Start scrolling after widget is built
    });
  }

  void _startScrolling() {
    double fullWidth = _screenWidth * 2; // Assuming double screen width for loop
    _scrollController.animateTo(
      fullWidth, // Move to the end
      duration: widget.scrollDuration,
      curve: Curves.linear, // Linear scroll effect
    ).then((_) {
      if (mounted) {
        _scrollController.jumpTo(0.0); // Reset to start after reaching the end
        _startScrolling(); // Start scrolling again
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 50.0, // Height of the marquee
      child: Row(
        children: [
          // "New" Tag
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              widget.newTagText,
              style: const TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          ),

          // Marquee Text
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.notices.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0), // Add spacing
                  child: Text(
                    widget.notices[index],
                    style: const TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
