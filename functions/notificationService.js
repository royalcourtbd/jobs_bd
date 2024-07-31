const admin = require("firebase-admin");

exports.sendJobNotification = (snap, context) => {
  const job = snap.data();
  const jobId = context.params.jobId;
  const payload = {
    notification: {
      title: job.jobTitle,
      body: `Salary: ${job.salaryRange}`,
      image: job.imgUrl,
    },
    data: {
      jobId: jobId,
    }
  };

  // Fetch the list of device tokens from deviceInfo collection.
  return admin.firestore().collection("device_info").get().then((snapshot) => {
    const tokens = [];
    snapshot.forEach((doc) => {
      if (doc.data().deviceToken) {
        tokens.push(doc.data().deviceToken);
      }
    });
    if (tokens.length > 0) {
      const message = {
        tokens: tokens,
        notification: payload.notification,
        data: payload.data,
      };
      // Send notifications to all tokens using sendMulticast.
      return admin.messaging().sendMulticast(message);
    } else {
      console.log("No device tokens available");
      return null;
    }
  }).catch((error) => {
    console.error("Error sending notification:", error);
  });
};