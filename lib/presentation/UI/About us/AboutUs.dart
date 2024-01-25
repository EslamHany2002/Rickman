import 'package:flutter/material.dart';
import 'package:rickman/presentation/UI/About%20us/Widget/TextCard.dart';
import 'package:rickman/presentation/UI/Developer/App%20Developer.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
          children: [
            TextCard(content: "About us"),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Rickman: Your AI Companion in Brain Cancer Detection",
              style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Welcome to Rickman, your personal AI-powered app for brain cancer detection and monitoring. Rickman empowers you to take control of your health with two intuitive and powerful pages:",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Page 1: Detect and Analyze with Confidence",
              style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "MRI Image Upload: Simply upload your MRI scans directly from your phone or tablet. Rickman's advanced algorithms can handle multiple image formats, ensuring seamless integration with any healthcare provider's system.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Automated Analysis: Sit back and relax as Rickman's AI engine meticulously analyzes your scans. Look for progress indicators and estimated processing times to stay informed.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Detailed Results: Once complete, Rickman presents a clear and concise report on your scan. This includes:",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Tumor identification: Potential tumors are highlighted and categorized based on their characteristics.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Size and location: Get precise measurements and anatomical details of any identified tumors.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Severity assessment: Rickman provides an initial risk assessment based on the tumor's features.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Doctor's Review: Remember, Rickman is a tool, not a replacement for your doctor. Share the report with your physician for their expert interpretation and guidance.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Page 2: Your Personalized Health Profile",
              style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Medical History: Maintain a comprehensive record of your medical history, including past diagnoses, treatments, and medications. This helps Rickman tailor its analysis to your specific case.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Progress Tracking: Monitor your journey over time. Track changes in tumor size, location, and severity based on subsequent scans. ",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Rickman presents this data in easy-to-understand graphs and charts.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Educational Resources: Stay informed and empowered. Rickman provides access to curated articles, videos, and other resources about brain cancer, treatment options, and coping strategies.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Remember:",
              style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Rickman is not a diagnostic tool. Always consult your doctor for diagnosis and treatment decisions.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Rickman's accuracy is constantly improving with ongoing research and development.",
              style: TextStyle(fontSize: 16),
            ),
            const Text(
              "Early detection is crucial for successful brain cancer treatment. Use Rickman proactively to monitor your health and identify any potential changes.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextCard(content: "App Developer"),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  DeveloperCard(imagePath: "Assets/Images/me.jpg",name: "eslam hany",),
                  DeveloperCard(imagePath: "Assets/Images/me.jpg",name: "eslam hany",),
                  DeveloperCard(imagePath: "Assets/Images/me.jpg",name: "eslam hany",),
                  DeveloperCard(imagePath: "Assets/Images/me.jpg",name: "eslam hany",),
                  DeveloperCard(imagePath: "Assets/Images/me.jpg",name: "eslam hany",),
                  DeveloperCard(imagePath: "Assets/Images/me.jpg",name: "eslam hany",),
                  DeveloperCard(imagePath: "Assets/Images/me.jpg",name: "eslam hany",),
                ],
              ),
            ),

            // AppDeveloper(),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Image.asset("Assets/Images/me.jpg"),
            // ),
            const SizedBox(height: 20),
            // Text("viewModel!.local!.aboutUsMessage1", style: Theme.of(context).textTheme.displayLarge)
          ],
        ),
      ),
    );
  }
}
