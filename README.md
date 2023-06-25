<hr/>
<p align="center">
  <img src="https://user-images.githubusercontent.com/62181222/187184324-f40200f1-69e6-4b88-bda7-c314812c7de9.png" alt="logo" width="20%" />
</p>

<p align="center">
  A passwordless (biometric based) web authentication system.
</p>

<p align="center">
  <a href="https://github.com/aratheunseen/signature-for-developers">
    <img src="https://img.shields.io/badge/signature%20for%20developers-017CEE.svg?style=for-the-badge&logoColor=white" alt="Signature for Developer" />
  </a>
  <a href="https://github.com/aratheunseen/signature-client-demo">
    <img src="https://img.shields.io/badge/signature%20client%20demo-E6526F.svg?style=for-the-badge&logoColor=white" alt="Signature Client Demo" />
  </a>
  <a href="https://github.com/aratheunseen/signature-app-landing-page">
    <img src="https://img.shields.io/badge/Signature%20Landing%20Page-%232C5263.svg?style=for-the-badge&logoColor=white" alt="Signature App Landing Page" />
  </a>
</p>

<p align="center">
  <img alt="Signatures' Workflow Status (with branch)" src="https://img.shields.io/github/actions/workflow/status/aratheunseen/signature-passwordless-web-authenticaton/test.yml?branch=main&label=Build&style=for-the-badge">
    <img alt="Signatures' Code Size" src="https://img.shields.io/github/languages/code-size/aratheunseen/signature?style=for-the-badge">
    <img alt="Top Language used in Signature" src="https://img.shields.io/github/languages/top/aratheunseen/signature?style=for-the-badge&logo=dart&color=lightblue">
</p>

<hr/>

<table align="center">
  <tr>
    <th>Onboarding</th>
    <th>SignUp</th>
    <th>LockScreen</th>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/62181222/235098555-e4f869f2-6588-4656-a494-f49135b87e90.PNG" width="350"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/235098571-dd588f7a-6ab1-4463-8c28-1b562b1086bc.PNG" width="350"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/235098613-d2f575f8-28e6-4ca4-84e2-471a6fa2eb15.PNG" width="350"></td>
  </tr>
  <tr>
    <th>AuthConfirmation</th>
    <th>Homepage</th>
    <th>Settings</th>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/62181222/235112057-ec3083e6-9ad1-4446-a550-f5171d44a2e7.PNG" width="350"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/235098625-26b17e4f-f30c-4d12-97e4-f82bdf8ba594.PNG" width="350"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/235105504-44d328e9-5510-4601-9729-13e960919b25.PNG" width="350"></td>
  </tr>
</table>

<hr/>

## Getting Started

1. Clone the GitHub repository:
    ```bash
    git clone https://github.com/aratheunseen/signature-passwordless-web-authenticaton.git
    ```

2. Navigate to the project directory:
    ```
    cd signature-passwordless-web-authenticaton
    ```

3. Get the required dependencies by running the following command:
    ```
    flutter pub get
    ```

4. Next, you need to create a new Firebase project and configure it for this application. You can follow the instructions in this article: https://firebase.google.com/docs/flutter/setup.

5. Once your Firebase project is set up, you'll need to add your Firebase configuration files to the project. Specifically, you'll need to add your google-services.json file for Android. You can download these files from the Firebase console.

6. After adding the Firebase configuration files, you need to enable Firebase Authentication in your Firebase project. You can do this by going to the Authentication section in the Firebase console and following the instructions to enable authentication. Once Firebase Authentication is enabled, you'll need to set up the Firebase Authentication providers in your Flutter app. Specifically, you'll need to configure the phone authentication provider. You can follow the instructions in this article: https://firebase.google.com/docs/auth/flutter/start.

7. Connect your Android or iOS device to your computer, or launch an emulator.

8. Run the app by executing the following command:
    ```
    flutter run
    ```
    This will launch the app on your device or emulator.

9. If you want to build an APK file, run the following command:
    ```
    flutter build apk --release
    ```

Note: Before running the app, make sure you have a suitable development environment set up for Flutter. You can refer to the official documentation for more information on setting up your development environment: https://flutter.dev/docs/get-started/install.


## Requirements

1. Flutter SDK installed on your computer
2. Android Studio or VS Code with Flutter extensions installed
3. An emulator or physical device to run the app on
4. Git installed on your computer to clone the repository
