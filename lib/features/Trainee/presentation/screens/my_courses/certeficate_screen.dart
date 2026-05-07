// // import 'package:flutter/material.dart';
// // import 'package:lms_mobileapp/core/constants/colors.dart';
// // import 'package:lms_mobileapp/core/constants/spacing.dart';
// // import 'package:lms_mobileapp/core/constants/text_theme.dart';

// // class CertificateScreen extends StatelessWidget {
// //   const CertificateScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.background,
// //       appBar: AppBar(
// //         backgroundColor: AppColors.background,
// //         elevation: 0,
// //         title: const Text("The Atelier", style: AppTextTheme.headingMD),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           children: [
// //             // Certificate Card
// //             Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(20),
// //                 boxShadow: [
// //                   BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20),
// //                 ],
// //               ),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(24),
// //                 child: Column(
// //                   children: [
// //                     const Icon(Icons.verified_user, size: 80, color: Colors.green),
// //                     AppSpacing.verticalMd,
// //                     const Text("LUMINA", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 4)),
// //                     const Text("ACADEMY", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
// //                     AppSpacing.verticalLg,
// //                     const Text("CERTIFICATE OF ACHIEVEMENT", style: TextStyle(fontSize: 14, letterSpacing: 2)),
// //                     AppSpacing.verticalLg,
// //                     const Text("This is to certify that", style: AppTextTheme.bodyRegular),
// //                     const Text("Alex Morgan", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
// //                     AppSpacing.verticalSm,
// //                     const Text("has successfully completed all requirements and demonstrated mastery in the professional curriculum of"),
// //                     AppSpacing.verticalLg,
// //                     const Text("Advanced Architectural Visualization", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green)),
// //                     AppSpacing.verticalLg,
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         const Text("October 1, 2025"),
// //                         AppSpacing.horizontalLg,
// //                         const Text("Director of Education"),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 40),
// //                     const CircleAvatar(radius: 40, backgroundColor: Colors.amber),
// //                   ],
// //                 ),
// //               ),
// //             ),

// //             AppSpacing.verticalLg,

// //             // Credentials
// //             const Text("Your Credentials", style: AppTextTheme.headingMD),
// //             AppSpacing.verticalSm,
// //             const Text("Congratulations, Alex! Your achievement is now officially recorded and verified."),

// //             AppSpacing.verticalLg,

// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: ElevatedButton.icon(
// //                     onPressed: () {},
// //                     icon: const Icon(Icons.download),
// //                     label: const Text("Download PDF"),
// //                     style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
// //                   ),
// //                 ),
// //                 AppSpacing.horizontalMd,
// //                 Expanded(
// //                   child: OutlinedButton.icon(
// //                     onPressed: () {},
// //                     icon: const Icon(Icons.share),
// //                     label: const Text("Share Achievement"),
// //                   ),
// //                 ),
// //               ],
// //             ),

// //             AppSpacing.verticalLg,

// //             // Public Verification
// //             Container(
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: AppColors.surface,
// //                 borderRadius: BorderRadius.circular(16),
// //               ),
// //               child: Column(
// //                 children: [
// //                   const Text("PUBLIC VERIFICATION", style: TextStyle(fontWeight: FontWeight.w600)),
// //                   AppSpacing.verticalSm,
// //                   const Text("CERTIFICATE ID: LUM-ABC-123", style: TextStyle(fontWeight: FontWeight.bold)),
// //                   AppSpacing.verticalSm,
// //                   const Text("This certificate is cryptographically signed and notarized on the blockchain.", style: AppTextTheme.bodySmall),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:lms_mobileapp/core/constants/colors.dart';
// import 'package:lms_mobileapp/core/constants/spacing.dart';
// import 'package:lms_mobileapp/core/constants/text_theme.dart';

// class CertificateScreen extends StatelessWidget {
//   final String studentName;
//   final String courseTitle;
//   final String academy;
//   final String date;

//   const CertificateScreen({
//     super.key,
//     required this.studentName,
//     required this.courseTitle,
//     required this.academy,
//     required this.date,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: AppColors.background,
//         elevation: 0,
//         title: Text(academy, style: AppTextTheme.headingMD),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // Certificate Card
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.08),
//                     blurRadius: 20,
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(24),
//                 child: Column(
//                   children: [
//                     const Icon(Icons.verified_user, size: 80, color: Colors.green),

//                     AppSpacing.verticalMd,

//                     Text(
//                       academy.toUpperCase(),
//                       style: const TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         letterSpacing: 4,
//                       ),
//                     ),

//                     const Text(
//                       "ACADEMY",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),

//                     AppSpacing.verticalLg,

//                     const Text(
//                       "CERTIFICATE OF ACHIEVEMENT",
//                       style: TextStyle(fontSize: 14, letterSpacing: 2),
//                     ),

//                     AppSpacing.verticalLg,

//                     const Text(
//                       "This is to certify that",
//                       style: AppTextTheme.bodyRegular,
//                     ),

//                     Text(
//                       studentName,
//                       style: const TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),

//                     AppSpacing.verticalSm,

//                     const Text(
//                       "has successfully completed all requirements and demonstrated mastery in the professional curriculum of",
//                       textAlign: TextAlign.center,
//                     ),

//                     AppSpacing.verticalLg,

//                     Text(
//                       courseTitle,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.green,
//                       ),
//                     ),

//                     AppSpacing.verticalLg,

//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(date),
//                         AppSpacing.horizontalLg,
//                         const Text("Director of Education"),
//                       ],
//                     ),

//                     const SizedBox(height: 40),

//                     const CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Colors.amber,
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             AppSpacing.verticalLg,

//             // Credentials
//             const Text("Your Credentials", style: AppTextTheme.headingMD),

//             AppSpacing.verticalSm,

//             Text(
//               "Congratulations, $studentName! Your achievement is now officially recorded and verified.",
//               textAlign: TextAlign.center,
//             ),

//             AppSpacing.verticalLg,

//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton.icon(
//                     onPressed: () {
//                       // TODO: Implement PDF download
//                     },
//                     icon: const Icon(Icons.download),
//                     label: const Text("Download PDF"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                     ),
//                   ),
//                 ),
//                 AppSpacing.horizontalMd,
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     onPressed: () {
//                       // TODO: Implement share
//                     },
//                     icon: const Icon(Icons.share),
//                     label: const Text("Share Achievement"),
//                   ),
//                 ),
//               ],
//             ),

//             AppSpacing.verticalLg,

//             // Public Verification
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: AppColors.surface,
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Column(
//                 children: [
//                   const Text(
//                     "PUBLIC VERIFICATION",
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                   AppSpacing.verticalSm,
//                   const Text(
//                     "CERTIFICATE ID: LUM-ABC-123",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   AppSpacing.verticalSm,
//                   const Text(
//                     "This certificate is cryptographically signed and notarized on the blockchain.",
//                     style: AppTextTheme.bodySmall,
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:lms_mobileapp/core/constants/colors.dart';
import 'package:lms_mobileapp/core/constants/spacing.dart';
import 'package:lms_mobileapp/core/constants/text_theme.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text("The Atelier", style: AppTextTheme.headingMD),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Certificate Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)],
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const Icon(Icons.verified_user, size: 90, color: Colors.green),
                    AppSpacing.verticalMd,
                    const Text("LUMINA", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 6)),
                    const Text("ACADEMY", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300)),
                    AppSpacing.verticalLg,
                    const Text("CERTIFICATE OF ACHIEVEMENT", style: TextStyle(letterSpacing: 3, fontSize: 14)),
                    AppSpacing.verticalLg,
                    const Text("This is to certify that", style: AppTextTheme.bodyRegular),
                    const Text("Alex Morgan", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
                    AppSpacing.verticalLg,
                    const Text("has successfully completed all requirements and demonstrated mastery in the professional curriculum of"),
                    AppSpacing.verticalLg,
                    const Text("Advanced Architectural Visualization", 
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.green)),
                    AppSpacing.verticalXl,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("October 1, 2025"),
                        Text("Director of Education"),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const CircleAvatar(radius: 45, backgroundColor: Colors.amber),
                  ],
                ),
              ),
            ),

            AppSpacing.verticalLg,

            const Text("Your Credentials", style: AppTextTheme.headingMD),
            const Text("Congratulations, Alex! Your achievement is now officially recorded and verified."),

            AppSpacing.verticalLg,

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text("Download PDF"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
                AppSpacing.horizontalMd,
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    label: const Text("Share Achievement"),
                  ),
                ),
              ],
            ),

            AppSpacing.verticalLg,

            // Public Verification
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text("PUBLIC VERIFICATION", style: TextStyle(fontWeight: FontWeight.w600)),
                  AppSpacing.verticalSm,
                  const Text("CERTIFICATE ID: LUM-ABC-123", style: TextStyle(fontWeight: FontWeight.bold)),
                  AppSpacing.verticalSm,
                  const Text("This certificate is cryptographically signed and notarized on the blockchain.", 
                      style: AppTextTheme.bodySmall, textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}