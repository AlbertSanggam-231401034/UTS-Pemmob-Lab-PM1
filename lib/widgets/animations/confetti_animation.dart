import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ConfettiAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool isStopped;

  const ConfettiAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.isStopped = false,
  }) : super(key: key);

  @override
  _ConfettiAnimationState createState() => _ConfettiAnimationState();
}

class _ConfettiAnimationState extends State<ConfettiAnimation> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(duration: widget.duration);
    if (!widget.isStopped) {
      _controller.play();
    }
  }

  @override
  void didUpdateWidget(ConfettiAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isStopped && _controller.state == ConfettiControllerState.playing) {
      _controller.stop();
    } else if (!widget.isStopped && _controller.state != ConfettiControllerState.playing) {
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        // Top Center Confetti
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _controller,
            blastDirection: 3.14 / 2, // Arah ke bawah (bukan -3.14/2)
            maxBlastForce: 5,
            minBlastForce: 2,
            emissionFrequency: 0.05,
            numberOfParticles: 20,
            gravity: 0.1,
            // shouldLoop: true, // Sebaiknya jangan loop
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange,
              Colors.purple,
            ],
          ),
        ),
      ],
    );
  }
}