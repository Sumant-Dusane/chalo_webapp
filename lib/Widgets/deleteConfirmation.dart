import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
/*
class ConfirmDeleteRoute extends StatefulWidget {

  ConfirmDeleteRoute({super.key, this.onDelete});

  final VoidCallback? onDelete;

  @override
  State<ConfirmDeleteRoute> createState() => _ConfirmDeleteRouteState();
}

class _ConfirmDeleteRouteState extends State<ConfirmDeleteRoute> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _confirmDialog(context),
    );
  }

  _confirmDialog(BuildContext context) => Container(
    child:  Container(
      height: 250,
      width: 450,
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 60),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Column(
        children: [
          Image.asset(
            "./images/danger.png",
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 12),
          const Text(
            "Do want to really delete this route?",
            style: TextStyle(
              
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.red[700],
                ),
                child: const Text(
                  "NO, Move Back",
                  style: TextStyle(
                    
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: widget.onDelete,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.green[900],
                ),
                child: const Text(
                  "YES, Go Ahead",
                  style: TextStyle(
                    
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  void _displayErrorMotionToast(BuildContext context) {
    MotionToast.error(
      title: const Text(
        'Deleted',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      description: const Text(
        'Route Deleted',
        style: TextStyle(fontSize: 12),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromBottom,
      dismissable: true,
      width: 300,
      borderRadius: 8.0,
      height: 60,
    ).show(context);
  }
}*/


class ConfirmDeleteRoute extends StatelessWidget {

  ConfirmDeleteRoute({Key? key, this.onDelete}) : super(key: key);

  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _confirmDialog(context),
    );
  }

  _confirmDialog(BuildContext context) => Container(
    child:  Container(
      height: 250,
      width: 450,
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 60),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
      ),
      child: Column(
        children: [
          Image.asset(
            "./images/danger.png",
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 12),
          const Text(
            "Do want to really delete this route?",
            style: TextStyle(
              
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.red[700],
                ),
                child: const Text(
                  "NO, Move Back",
                  style: TextStyle(
                    
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: (){
                  onDelete!();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.green[900],
                ),
                child: const Text(
                  "YES, Go Ahead",
                  style: TextStyle(
                    
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );


}
