import 'package:flutter/material.dart';

enum Interessi{
  mare,
  montagna,
  lago,
  piscina,
  bosco,
  spa
}

extension InteressiExtension on Interessi {
  Color get colore {
    switch(this) {
      case Interessi.mare:
        return Colors.blue.shade700;

      case Interessi.montagna:
        return Colors.orange;

      case Interessi.lago:
        return Colors.purple;

      case Interessi.piscina:
        return Colors.green;

      case Interessi.bosco:
        return Colors.brown;

      case Interessi.spa:
        return Colors.pinkAccent;
    }
  }
  IconData get icon {
    switch(this) {
      case Interessi.mare:
        return Icons.wb_sunny_outlined;

      case Interessi.montagna:
        return Icons.landscape_outlined;

      case Interessi.lago:
        return Icons.water;

      case Interessi.piscina:
        return Icons.pool;

      case Interessi.bosco:
        return Icons.nature;

      case Interessi.spa:
        return Icons.spa;

    }
  }
}