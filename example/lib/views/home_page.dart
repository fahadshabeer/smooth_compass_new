import 'package:flutter/material.dart';
import 'package:smooth_compass_new/utils/src/compass_ui.dart';
import 'package:smooth_compass_new/utils/src/widgets/error_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SmoothCompass(
          height: 300,
          width: 300,
          isQiblahCompass: true,

          //customize error message and error button style here
          errorDecoration: ErrorDecoration(
              spaceBetween: 20,
              buttonText: ButtonText(
                onPermissionDenied: "permission denied",
                onLocationDisabled: "location is disabled",
                onPermissionPermanentlyDenied: "open settings"
              ),
              permissionMessage: PermissionMessage(
                denied: "location permission is denied",
                permanentlyDenied: "location permission is permanently denied",
              ),
              buttonStyle: ErrorButtonStyle(
                  borderRadius: BorderRadius.circular(10),
                  buttonColor: Colors.red,
                  textColor: Colors.white,
                  buttonHeight: 40,
                  buttonWidth: 150),
              messageTextStyle: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),

          // compassBuilder: (context,snapshot,child){
          //   return  AnimatedRotation(
          //     duration: const Duration(milliseconds:800),
          //     turns: snapshot?.data?.turns??0,
          //     child: Stack(
          //       children: [
          //         Positioned(
          //           top: 0,
          //           left: 0,
          //           right: 0,
          //           bottom: 0,
          //           child:Image.asset("assets/images/compass.png",fit: BoxFit.fill,),
          //         ),
          //         Positioned(
          //           top: 0,
          //           left: 0,
          //           right: 0,
          //           bottom: 0,
          //           child:AnimatedRotation(
          //               duration: const Duration(milliseconds: 500),
          //               turns: (snapshot?.data?.qiblahOffset??0)/360,
          //               child: Container(
          //                 decoration: const BoxDecoration(
          //                   shape: BoxShape.circle,),
          //                 child: const VerticalDivider(
          //                   color: Colors.grey,
          //                   thickness: 5,),
          //               )
          //           ),
          //         ),
          //       ],
          //     ),
          //   );
          // },
        ),
      ),
    );
  }
}
