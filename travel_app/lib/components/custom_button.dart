import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {

  final IconData icon;
  final Color colore;
  const CustomButton({Key? key, required this.icon, required this.colore}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {


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
        color: widget.colore,
      ),
      width: 50,
      height: 50,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        icon: Icon(widget.icon),
      ),
    );
  }
}
