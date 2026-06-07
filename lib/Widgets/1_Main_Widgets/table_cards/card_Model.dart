import 'dart:ui';

class card_Model {
  final String image;
  final String title;
  final String number;
  final VoidCallback? ontap;
  card_Model({
    required this.image,
    required this.title,
    required this.number,
    this.ontap,
  });


  
}