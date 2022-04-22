import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color colore;
  const CustomButton({Key? key, required this.icon, required this.colore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 4,
            offset: Offset(6, 8), // Shadow position
          ),
        ],
        borderRadius: BorderRadiusDirectional.circular(8),
        color: colore,
      ),
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(icon),
      ),
    );
  }
}
