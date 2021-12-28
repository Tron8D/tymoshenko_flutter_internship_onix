import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Download',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Icon(Icons.download),
          ],
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(30),
          shadowColor: MaterialStateProperty.all(Colors.lightGreen),
          backgroundColor: MaterialStateProperty.all(Colors.lightGreen),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
