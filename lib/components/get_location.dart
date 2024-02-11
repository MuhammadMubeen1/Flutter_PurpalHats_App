// import 'package:geocoding/geocoding.dart';


// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
// // ignore: depend_on_referenced_packages

//   List<Placemark>? placemarks;
//   Position? position;

//  getUserLocationAddress() async
//   {
//     Position newPosition = await Geolocator.getCurrentPosition(
//         desiredAccuracy:  
//     );

//     position = newPosition;

//     placemarks = await placemarkFromCoordinates(
//         position!.latitude, position!.longitude
//     );

//     Placemark pMark = placemarks![0];

//     String fullAddress = '${pMark.subThoroughfare} ${pMark.thoroughfare}, ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

//     _locationController.text = fullAddress;

   
//   }