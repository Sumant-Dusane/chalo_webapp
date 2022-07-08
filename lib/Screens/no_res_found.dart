import 'package:flutter/material.dart';

class NoResultFound extends StatefulWidget {
  const NoResultFound({Key? key}) : super(key: key);

  @override
  State<NoResultFound> createState() => _NoResultFoundState();
}

class _NoResultFoundState extends State<NoResultFound> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const SizedBox(height: 200),
        Image.asset(
          "./images/notFound.png",
          height: 250,
          alignment: Alignment.topCenter,
        ),
        const SizedBox(height: 50),
        const Text(
          "No Routes Found",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
