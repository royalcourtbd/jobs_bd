// import 'package:flutter/material.dart';

// class FeatureScreen extends StatelessWidget {
//   const FeatureScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F2F2),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Organic Blob and Elements
//           Center(
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 // Blob Shape
//                 CustomPaint(
//                   size: const Size(300, 350),
//                   painter: BlobPainter(),
//                 ),

//                 // Dotted Path and Elements (positioned based on blob shape)
//                 // ... (Implementation for positioning each element on the path)
//               ],
//             ),
//           ),

//           const SizedBox(height: 50),

//           // Text Content
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Best Feature in This App',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'We have added many new features like Bookmark, Hifz, Word by Word, Quranic Audio, Go Directly to Ayah and Last Read etc.',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 50),

//           // Next Button
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 30),
//             child: ElevatedButton(
//               onPressed: () {
//                 // TODO: Implement navigation logic
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF8E7665),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: const Text(
//                 'Next',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Painter for the Irregular Blob Shape
// class BlobPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = const Color(0xFFEEE6DA)
//       ..style = PaintingStyle.fill;

//     var path = Path();
//     // ... (Path definition for the irregular blob shape)

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
