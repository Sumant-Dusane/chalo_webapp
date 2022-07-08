import 'package:chalo_webapp/Screens/saved_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../Data/Modal.dart';
import '../Data/constants.dart';
import '../Widgets/dialogueHelper.dart';
import 'no_res_found.dart';

class HomeScreen extends StatefulWidget {
  var routeList = <Modal>[].obs;
  var nameRoute = TextEditingController();
  var routeStart = TextEditingController();
  var routeStop = TextEditingController();

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.white,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Image.asset(
                    "./images/logo.png",
                    height: 200,
                  ),
                ),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Public Transit Route",
                      style: TextStyle(
                        fontSize: 22,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: size.width,
          child: Column(
            children: [
              const SizedBox(height: 15),
              Visibility(
                visible: !isVisible,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    primary: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Add new route",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Container(
                  width: size.width - 200,
                  margin: const EdgeInsets.fromLTRB(50, 45, 50, 0),
                  decoration: const BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 50),
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        alignment: Alignment.centerRight,
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 20.0),
                          child: TextField(
                            controller: widget.nameRoute,
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            cursorColor: kPrimaryColor,
                            decoration: const InputDecoration(
                              hintText: "Route Name",
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
                          )),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 0.0),
                        child: TextField(
                          controller: widget.routeStart,
                          decoration: const InputDecoration(
                            hintText: "Start",
                            prefixIcon:
                                Icon(Icons.pin_drop, color: Colors.green),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 0.0),
                        child: TextField(
                          controller: widget.routeStop,
                          decoration: const InputDecoration(
                            hintText: "Stop",
                            prefixIcon: Icon(Icons.pin_drop, color: Colors.red),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        height: 300,
                        width: size.width,
                        child: const GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(100, 200),
                          ),
                        ),
                      ),
                      const SizedBox(height: 35.0),
                      ElevatedButton(
                        onPressed: () {
                          if (GetUtils.isNullOrBlank("${widget.nameRoute}") == true) {
                            _displayErrorMotionToast(context);
                          } else {
                            widget.routeList.value.add(Modal(
                                routeId: DateTime.now().millisecondsSinceEpoch.remainder(100000).toString(),
                                routeName: "${widget.nameRoute.text.toString()}",
                                start: "${widget.routeStart.text.toString()}",
                                stop: "${widget.routeStop.text.toString()}"));
                            widget.routeList.refresh();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 27.0, horizontal: 0.0),
                          primary: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.4),
                          ),
                        ),
                        child: const Text(
                          "ADD ROUTE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35.0),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return widget.routeList.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ShowRoutes(
                              routeName:
                                  "${widget.routeList.value.elementAt(index).routeName}",
                              routePickup:
                                  "${widget.routeList.value.elementAt(index).start}",
                              routeDestination:
                                  "${widget.routeList.value.elementAt(index).stop}",
                              onDelete: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => _confirmDialog(
                                          context,
                                          onDelete: () {
                                            widget.routeList.value
                                                .removeAt(index);
                                            widget.routeList.refresh();
                                            Navigator.of(context).pop();
                                          },
                                        ));
                              });
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 25);
                        },
                        itemCount: widget.routeList.length,
                      )
                    : const NoResultFound();
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _removeRoute() {
    DialogueHelper.exit(Get.context);
  }

  Widget _confirmDialog(BuildContext context, {VoidCallback? onDelete}) {
    return Container(
      height: 250,
      width: 450,
      alignment: Alignment.center,
      // margin: const EdgeInsets.symmetric(vertical: 250, horizontal: 550),
      // margin: EdgeInsets.symmetric(vertical: Get.height/2, horizontal: Get.width/2),

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
            children: [
              ElevatedButton(
                onPressed: () {
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
                onPressed: onDelete,
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
    );
  }

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
}
