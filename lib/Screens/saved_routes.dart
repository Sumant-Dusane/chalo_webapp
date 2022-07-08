import 'package:chalo_webapp/Widgets/dialogueHelper.dart';
import '../Data/constants.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motion_toast/resources/arrays.dart';

class ShowRoutes extends StatefulWidget {
  ShowRoutes(
      {Key? key,
      this.onDelete,
      this.routeName,
      this.routePickup,
      this.routeDestination})
      : super(key: key);

  final VoidCallback? onDelete;
  final String? routeName;
  final String? routePickup;
  final String? routeDestination;
  bool isEnabled = false;

  var nameRoute = TextEditingController();
  var routeStart = TextEditingController();
  var routeStop = TextEditingController();

  @override
  State<ShowRoutes> createState() => _ShowRoutesState();
}

class _ShowRoutesState extends State<ShowRoutes> {
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.nameRoute.text = widget.routeName ?? "";
      widget.routeStart.text = widget.routePickup ?? "";
      widget.routeStop.text = widget.routeDestination ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      margin: const EdgeInsets.fromLTRB(30, 45, 30, 0),
      alignment: Alignment.center,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: kPrimaryColor,
              backgroundColor: kSecondaryColor,
              collapsedBackgroundColor: kSecondaryColor,
              title: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isEnabled = !widget.isEnabled;
                      });
                    },
                    icon: const Icon(Icons.edit, color: Colors.white),
                  ),
                  const SizedBox(width: 25),
                  Container(
                    width: 350,
                    child: TextField(
                      enabled: widget.isEnabled,
                      controller: widget.nameRoute,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      cursorColor: kPrimaryColor,
                      decoration: const InputDecoration(
                        hintText: "Route 1",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              children: [
                Text(
                  "# ${DateTime.now().millisecondsSinceEpoch.remainder(100000).toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 25.0),
                  child: TextField(
                    enabled: widget.isEnabled,
                    controller: widget.routeStart,
                    decoration: const InputDecoration(
                      hintText: "Start Destination",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      prefixIcon: Icon(Icons.pin_drop),
                      prefixIconColor: Colors.deepOrange,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 25.0),
                  child: TextField(
                    enabled: widget.isEnabled,
                    controller: widget.routeStop,
                    decoration: const InputDecoration(
                      hintText: "End Destination",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      filled: true,
                      prefixIcon: Icon(Icons.pin_drop),
                      prefixIconColor: Colors.green,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: size.width,
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 25.0),
                  child: const GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(100, 200),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(55.0, 8.0, 8.0, 8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _displaySuccessMotionToast();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          primary: Colors.green[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.4),
                          ),
                        ),
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      ElevatedButton(
                        onPressed: widget.onDelete,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          primary: Colors.red[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.4),
                          ),
                        ),
                        child: const Text(
                          'REMOVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _displaySuccessMotionToast() {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text(
        'Saved Successfully',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromBottom,
      dismissable: true,
      width: 300.0,
      height: 60.0,
      borderRadius: 8.0,
    ).show(context);
  }

  void _removeRoute() {
    DialogueHelper.exit(context);
  }
}

/*

class ShowRoutes extends StatefulWidget {

  ShowRoutes({Key? key, this.onDelete}) : super(key: key);

  final VoidCallback? onDelete;

  @override
  State<ShowRoutes> createState() => _ShowRoutesState();
}

class _ShowRoutesState extends State<ShowRoutes> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Container(
      width: size.width,
      margin: const EdgeInsets.fromLTRB(30, 45, 30, 0),
      alignment: Alignment.center,
      //TODO: Listview.builder add
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: kPrimaryColor,
              backgroundColor: kSecondaryColor,
              collapsedBackgroundColor: kSecondaryColor,
              title: Row(
                children: [
                  Container(
                    width: 350,
                    child: TextField(

                      style: const TextStyle(
                        fontSize: 20.0,
                        color: kPrimaryColor,

                        fontWeight: FontWeight.bold,
                      ),
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                        hintText: "Route1",
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit, color: Colors.white),
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 20.0,
                          color: kPrimaryColor,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              children: [
                const Text(
                  "ID: #61864",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Start Destination",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor ),
                      ),
                      prefixIcon: Icon(Icons.pin_drop),
                      prefixIconColor: Colors.deepOrange,
                      suffixIcon: Icon(Icons.delete),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Stop Destination",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor ),
                      ),
                      filled: true,
                      prefixIcon: Icon(Icons.pin_drop),
                      prefixIconColor: Colors.green,
                      suffixIcon: Icon(Icons.delete),
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: size.width,
                  padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 25.0),
                  child: const GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(100, 200),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(55.0, 8.0, 8.0, 8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _displaySuccessMotionToast();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          primary: Colors.green[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.4),
                          ),
                        ),
                        child: const Text(
                          'SAVE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      const SizedBox(width: 25),
                      ElevatedButton(
                        */
/*onPressed: () {
                          _removeRoute();
                        },*/ /*

                        onPressed: onDelete,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0),
                          primary: Colors.red[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.4),
                          ),
                        ),
                        child: const Text(
                          'REMOVE',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ],
      ),
    );

  }

  void _displaySuccessMotionToast() {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(fontWeight: FontWeight.bold, ),
      ),
      description: const Text(
        'Saved Successfully',
        style: TextStyle(fontSize: 12, ),
      ),
      layoutOrientation: ToastOrientation.ltr,
      animationType: AnimationType.fromBottom,
      dismissable: true,
      width: 300.0,
      height: 60.0,
      borderRadius: 8.0,
    ).show(Get.context!);
  }

  void _removeRoute(){
    DialogueHelper.exit(Get.context!);
  }
}

*/
