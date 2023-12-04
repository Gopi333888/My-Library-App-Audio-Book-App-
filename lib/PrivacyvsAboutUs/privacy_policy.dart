import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const PrivacyPolicy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Privacy Policy"),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy for My Library",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Last updated: December 04, 2023",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 16.0),
            Text(
              "This Privacy Policy outlines how we collect, use, and disclose your information when you use our service. By using the service, you agree to the terms of this policy.",
            ),
            SizedBox(height: 16.0),
            Text(
              "Definitions:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("Account: Unique account for service access."),
            Text("Affiliate: Entity under common control with us."),
            Text("Application: My Library software."),
            Text("Company: My Library."),
            Text("Country: Kerala, India."),
            Text("Device: Any device accessing the service."),
            Text(
                "Personal Data: Information about an identifiable individual."),
            Text("Service: The My Library application."),
            Text("Service Provider: Entity processing data on our behalf."),
            Text(
                "Usage Data: Automatically collected data during service use."),
            Text("You: Individual or entity using the service."),
            SizedBox(height: 16.0),
            Text(
              "Collecting and Using Your Personal Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("Types of Data Collected:"),
            Text("Personal Data: Email, first and last name."),
            Text("Usage Data: IP address, browser info, page visits."),
            SizedBox(height: 8.0),
            Text("Use of Your Personal Data:"),
            Text("Provide and maintain service."),
            Text("Manage your account and registration."),
            Text("Perform contract obligations."),
            Text("Contact you for updates."),
            Text("Provide news and offers."),
            Text("Manage requests and improve service."),
            SizedBox(height: 8.0),
            Text("Sharing Your Information:"),
            Text("With service providers."),
            Text("For business transfers."),
            Text("With affiliates."),
            Text("With business partners."),
            Text("In public areas with other users."),
            Text("With consent for other purposes."),
            SizedBox(height: 16.0),
            Text(
              "Retention and Transfer of Your Personal Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("Retained as long as necessary."),
            Text("Usage Data retained for analysis."),
            Text("Data may be transferred to other locations."),
            SizedBox(height: 16.0),
            Text(
              "Delete Your Personal Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("You can delete certain information within the service."),
            Text("Contact us for assistance."),
            Text("Note: Legal obligations may require data retention."),
            SizedBox(height: 16.0),
            Text(
              "Disclosure of Your Personal Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("In business transactions."),
            Text("If required by law or authorities."),
            Text("To protect rights, property, or safety."),
            SizedBox(height: 16.0),
            Text(
              "Security of Your Personal Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("No method is 100% secure."),
            Text("We use acceptable means for protection."),
            SizedBox(height: 16.0),
            Text(
              "Children's Privacy:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("Service not for users under 13."),
            Text("No knowingly collected data from under 13."),
            SizedBox(height: 16.0),
            Text(
              "Links to Other Websites:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("We are not responsible for third-party websites."),
            SizedBox(height: 16.0),
            Text(
              "Changes to this Privacy Policy:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("Updated from time to time."),
            Text("Changes effective upon posting."),
            SizedBox(height: 16.0),
            Text(
              "Contact Us:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Email: krishnanagopi03@gmail.com",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
