import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/static/urls.dart';
import 'package:jobs_bd/data/dummy_data_model/job_model.dart';

class JobPresentation extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<int> _getNextJobId() async {
    final docRef = firestore.collection('counters').doc('jobIdCounter');
    final doc = await docRef.get();

    if (doc.exists) {
      int currentId = doc.data()!['currentId'];
      await docRef.update({'currentId': currentId + 1});
      return currentId + 1;
    } else {
      // If the document does not exist, create it and return the initial id
      await docRef.set({'currentId': 1});
      return 1;
    }
  }

  job() async {
    final id = firestore.collection(Urls.allJobs).doc().id;
    final docRef = firestore.collection(Urls.allJobs).doc(id);

    final jobId = await _getNextJobId();

    JobModel newJob = JobModel(
      documentId: id,
      category: 'Government Jobs',
      companyName: 'Passport Office',
      jobDeadLine: DateTime.now().toString(),
      jobDescription: text2,
      imgUrl:
          'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
      jobId: jobId.toString(),
      jobTitle: 'Software Engineer',
      link: 'https://www.google.com/careers',
      location: 'Dhaka, Bangladesh',
      posted: DateTime.now().toString(),
      status: 'live',
      totalView: 0,
      experience: '2+ years',
      officeTime: '10:00 - 19:00',
      salaryRange: 'up to 75k BDT',
      vacancy: 5,
      weekend: 'Friday & Saturday',
    );

    await docRef.set(newJob.toJson());
  }

  deleteJob(String id) async {
    await firestore.collection(Urls.allJobs).doc(id).delete();
  }
}

String text2 = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flutter Job Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1, h2, h3 {
            color: #333;
        }
        .highlight {
            color: #ff5722;
            font-weight: bold;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin: 5px 0;
        }
        .footer {
            margin-top: 20px;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>FLUTTER JOB POST</h1>
    <p><span class="highlight">Job Title:</span> Flutter Developer (3-Month Probationary Period)</p>
    <p><span class="highlight">Location:</span> Remote</p>
    <p><span class="highlight">Job Type:</span> Contract (with potential for full-time based on performance)</p>
    <p><span class="highlight">Salary:</span> \$800 per month during probation, with a review and potential salary increase based on performance after 3 months</p>
    
    <h2>Job Description:</h2>
    <p>We are seeking a talented and experienced Flutter Developer to join our dynamic team. This role starts with a 3-month probationary period to evaluate your performance, after which there is an opportunity for a salary review and potential increase based on your contributions and impact.</p>
    
    <h3>Key Responsibilities:</h3>
    <ul>
        <li>Develop and maintain hybrid applications using Flutter.</li>
        <li>Collaborate with cross-functional teams to define, design, and ship new features.</li>
        <li>Ensure the performance, quality, and responsiveness of applications.</li>
        <li>Identify and correct bottlenecks and fix bugs.</li>
        <li>Help maintain code quality, organization, and automation.</li>
        <li>Utilize Redux for state management to manage the application state effectively.</li>
    </ul>
    
    <h3>Requirements:</h3>
    <ul>
        <li>Proven experience as a Flutter Developer with a portfolio.</li>
        <li>Strong understanding of Flutter and Dart programming language.</li>
        <li>Better if have Experience with Redux state management.</li>
        <li>Familiarity with RESTful APIs and mobile libraries for networking.</li>
        <li>Knowledge of modern authorization mechanisms, such as JSON Web Token.</li>
        <li>Ability to understand business requirements and translate them into technical requirements.</li>
        <li>Experience with version control systems, such as Git.</li>
        <li>Excellent problem-solving skills and attention to detail.</li>
        <li>Strong communication skills and ability to work in a team-oriented environment.</li>
        <li>Willing to learn about the new packages if necessary.</li>
    </ul>
    
    <h3>How to Apply:</h3>
    <p>Interested candidates should send their resume, and a portfolio of their work to <a href="mailto:nishatnasir00@gmail.com">nishatnasir00@gmail.com</a>. Please include "Flutter Developer Application" in the subject line.</p>
    
    <div class="footer">
        <p>We look forward to reviewing your application and potentially welcoming you to our team!</p>
    </div>
</div>

</body>
</html>
''';

String text = r'''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Posting</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            max-height: 100%;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
        }
        .highlight {
            color: #ff5722;
            font-weight: bold;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin: 5px 0;
        }
        .footer {
            margin-top: 20px;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>EXABYTING IS HIRING MOBILE APPLICATION DEVELOPER (FLUTTER)</h1>
    <p><span class="highlight">Role:</span> Mobile Application Developer (Flutter)</p>
    <p><span class="highlight">Employment Type:</span> Full-time</p>
    <p><span class="highlight">Requirements:</span></p>
    <ul>
        <li>1. He has in-depth knowledge of what he is doing for the last 2+ years.</li>
        <li>2. Has 2+ years of native Android / iOS experience.</li>
        <li>3. He can defend things he mentioned in his resume.</li>
        <li>4. Flutter experience is a plus.</li>
    </ul>
    <p><span class="highlight">Experience:</span> 2+ years</p>
    <p><span class="highlight">Office Location:</span> Mohakhali DOHS.</p>
    <p><span class="highlight">Office Time:</span> 10:00 - 19:00</p>
    <p><span class="highlight">Weekend:</span> Friday & Saturday</p>
    <p><span class="highlight">Remuneration:</span> up to 75k BDT</p>
    <p><span class="highlight">Facilities:</span></p>
    <ul>
        <li>* Open Leave</li>
        <li>* 2 Festival Bonuses</li>
        <li>* Full Subsidized lunch</li>
        <li>* Yearly Tour</li>
        <li>* Mobile Recharge (up to Grand Parents)</li>
        <li>* Children Allowances</li>
        <li>* Subsidized Dormitory facilities</li>
    </ul>
    <div class="footer">
        <p>If you are looking for a change in your career around an aspiring culture, drop your resume via: <a href="mailto:mohieminul@eastnetic.com">mohieminul@eastnetic.com</a> with a subject line:</p>
        <p><strong>Applying for Flutter role: Exabyting</strong></p>
    </div>
</div>

</body>
</html>
''';
