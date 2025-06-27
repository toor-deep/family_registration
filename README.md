Family Registration App - README


📘 Overview
A Flutter application to manage family data, add/edit members, assign relationships, and export details as a PDF file.

🚀 Features
- 👤 Register and manage family members -
- 🔗 Auto-link relationships to Family Head
- 📄 Export family data as PDF
- 💾 Firebase integration
- 🎨 Clean, responsive UI


🛠 Installation
1. Clone the Repository:    git clone https://github.com/toor-deep/family_registration.git    cd family_registration
2.  Get Dependencies:
    lutter pub get
3.  Set Up Firebase:
     - Go to https://console.firebase.google.com/
     - Create a new project or use an existing one
     -  Add Firebase to your Android app
     - Download google-services.json and place it in android/app/
4.  Run the App:
      flutter run


📄 Export as PDF
- Tap the 📥 Download icon on the Home screen - PDF will be generated with family member data - Make sure storage permission is granted
🔒 Required Permissions
In AndroidManifest.xml: <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<application android:requestLegacyExternalStorage="true">
 Set minSdkVersion to 21 in android/app/build.gradle

📦 Dependencies Used
- flutter_bloc
- go_router
-   pdf
-  printing
 - firebase_core
 - cloud_firestore
 - 
 - permission_handler
💡 Tips
- Use permission_handler to request storage permissions - For custom PDF fonts, refer to: https://github.com/DavBfr/dart_pdf/wiki/Fonts-Management
📜 License
MIT License  © 2025 Amandeep Toor (https://github.com/toor-deep)
