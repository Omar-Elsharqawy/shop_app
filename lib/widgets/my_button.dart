import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String btnText;
  final void Function()? onPressed;
  final void Function()? FavonPressed;
  final bool isFav;
  const MyButton({super.key, required this.btnText, required this.onPressed, required this.isFav, required this.FavonPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
              onPressed: onPressed, child:
          Text(btnText)),
        ),
       isFav? IconButton(onPressed: FavonPressed, icon:Icon(Icons.favorite) ): SizedBox.shrink()
      ],
    );
  }
}
