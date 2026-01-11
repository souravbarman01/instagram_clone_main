import 'package:flutter/material.dart';


class Avatar extends StatelessWidget {
  const Avatar({super.key,required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.dividerColor;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 0.6),
      ),
      child: ClipOval(
        child: Image.network(
          'https://media.licdn.com/dms/image/v2/D5603AQHV8z7QYjKFxQ/profile-displayphoto-scale_200_200/B56Zjh5LGHHAAc-/0/1756136518978?e=2147483647&v=beta&t=6fDr4G8Ovijb69-LeW1l1E7tJ9d5rbz3Kwsiaw1JeZY',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            color: theme.cardColor,
            alignment: Alignment.center,
            child: Icon(Icons.person, size: size * 0.45, color: theme.hintColor),
          ),
        ),
      ),
    );
  }
}