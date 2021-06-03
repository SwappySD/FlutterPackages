library custom_switch_lib;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  bool value;
  bool enabled;
  final ValueChanged<bool> onChanged;
  Color activeColor;
  Color inactiveColor;
  final double widht;
  final double height;
  final double circle_widht;
  final double circle_height;
  final double circle_radious;

  CustomSwitch(
      {Key? key,
      required this.activeColor,
      required this.inactiveColor,
      required this.value,
      required this.onChanged,
      required this.widht,
      required this.height,
      required this.circle_widht,
      required this.circle_height,
      required this.circle_radious,
      required this.enabled})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;
  Color switchColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    switchColor = widget.inactiveColor;
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  void _onTap() {
    // if(widget.enabled) {
    print("Tapped!");

    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    // }
    setState(() {
      widget.value == false ? widget.value = true : widget.value = false;
      widget.enabled == false ? widget.enabled = true : widget.enabled = false;
      widget.enabled == false
          ? switchColor = widget.inactiveColor
          : switchColor = widget.activeColor;

      widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: _onTap,
          child: Container(
            width: widget.widht,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.circle_radious),
              // color: _circleAnimation.value == Alignment.centerLeft
              //     ? Colors.grey
              //     : Colors.blue,
              color: switchColor,
            ),
            child: Padding(

              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 0.0, left: 0.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.circle_widht,
                  height: widget.circle_height,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
