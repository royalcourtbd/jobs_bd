const functions = require("firebase-functions");
const admin = require("firebase-admin");
const notificationService = require("./notificationService");

admin.initializeApp();

exports.sendJobNotification = functions.firestore
  .document("all_jobs/{jobId}")
  .onCreate(notificationService.sendJobNotification);

// You can add more functions here as needed
// For example:
// exports.anotherFunction = functions.https.onRequest((req, res) => {
//   // Your function logic here
// });