import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Opacity(
          opacity: _animation.value,
          child: _buildTextWithAnimation('SR Shohan'),
        );
      },
    );
  }

  Widget _buildTextWithAnimation(String text) {
    List<Widget> textWidgets = [];

    for (int i = 0; i < text.length; i++) {
      textWidgets.add(
        Opacity(
          opacity: _calculateOpacity(i),
          child: Text(
            text[i],
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 64.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: textWidgets,
    );
  }

  double _calculateOpacity(int index) {
    const interval = 1.0 / 12.0; // Adjust the interval as needed
    double start = index * interval;
    double end = (index + 1) * interval;
    double opacity = _animation.value;

    if (opacity < start) {
      return 0.0;
    } else if (opacity < end) {
      return (opacity - start) / interval;
    } else {
      return 1.0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
