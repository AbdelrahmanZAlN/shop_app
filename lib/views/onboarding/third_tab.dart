import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset('assets/images/environment.png',
            // fit: BoxFit.fill,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text('On Board 3 Title',
            style: TextStyle(
                fontSize: 24
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('On Board 3 Body',
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      ],
    );
  }
}
