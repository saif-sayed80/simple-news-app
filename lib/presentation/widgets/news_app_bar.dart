import 'package:flutter/material.dart';

class NewsAppBar extends StatelessWidget{
  final String title;
  final IconData leadingIcon;
  final IconData? actionIcon;
  final bool centerTitle;
  final VoidCallback onLeadingPressed;
  final VoidCallback onActionPressed;
  
  const NewsAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.actionIcon,
    required this.centerTitle,
    required this.onLeadingPressed,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,

      leading: IconButton(
        onPressed: onLeadingPressed,
        icon: Icon(
          leadingIcon,
          size: 26,
          color: Colors.grey.shade700,
        ),
      ),

      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: 'PlayfairDisplay',
        ),
      ),

      actions: [
        IconButton(
          onPressed: onActionPressed,
          icon: Icon(
            actionIcon,
            size: 26,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(width: 8),
      ],

      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}