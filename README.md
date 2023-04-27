<hr/>
<p align="center">
  <img src="https://user-images.githubusercontent.com/62181222/187184324-f40200f1-69e6-4b88-bda7-c314812c7de9.png" alt="logo" width="20%" />
</p>

<p align="center">
  A passwordless (biometric based) web authentication system.
</p>

<hr/>

<table align="center">
  <tr>
    <th>Splash</th>
    <th>Accounts</th>
    <th>Histories</th>
    <th>Settings</th>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/62181222/225686767-a78ae96f-6fe3-4307-9a25-a5b9552d0b3c.png" width="250"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/225686327-7cbdbe56-5424-45a7-a987-4a356f07de24.png" width="250"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/225686334-9a429178-3f10-41c2-bfff-8ded36bf763e.png" width="250"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/225686364-ffbdd81e-1a93-4371-a460-cf1c7c076faf.png" width="250"></td>
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

4. Connect your Android or iOS device to your computer, or launch an emulator.

5. Run the app by executing the following command:
    ```
    flutter run
    ```
    This will launch the app on your device or emulator.

6. If you want to build an APK file, run the following command:
    ```
    flutter build apk --release
    ```

Note: Before running the app, make sure you have a suitable development environment set up for Flutter. You can refer to the official documentation for more information on setting up your development environment: https://flutter.dev/docs/get-started/install.


## Requirements

1. Flutter SDK installed on your computer
2. Android Studio or VS Code with Flutter extensions installed
3. An emulator or physical device to run the app on
4. Git installed on your computer to clone the repository

## Project Paths

    lib
    │   main.dart
    │   firebase_options.dart
    │
    ├───database
    │       local_tokens.dart
    │
    ├───features
    │       browser.dart
    │       toast.dart
    │
    ├───models
    │       token.dart
    │
    └───views
            accounts_main.dart
            applock_main.dart
            devices_main.dart
            histories_main.dart
            homepage.dart
            settings_about.dart
            settings_applock.dart
            settings_backup.dart
            settings_devicekey.dart
            settings_main.dart
            tokens_add_manual.dart
            tokens_add_via_qr.dart
            tokens_main.dart

## Screenshots - ([oldDev](https://github.com/aratheunseen/signature/tree/oldDev))

<table align="center">
  <tr>
    <th>Splash</th>
    <th>Token</th>
    <th>Devices</th>
    <th>Accounts</th>
    <th>Histories</th>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/62181222/212751884-0343c6fa-34c1-4217-b91b-da5953929e2d.png" width="200"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/212751893-6888142f-3632-4ddd-9e32-4b7e8d2f0654.png" width="200"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/212751896-9d7f3239-7f7a-4a00-99b4-391553668441.png" width="200"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/212751899-7cf53345-120e-46e6-b3f9-03df423e58c6.png" width="200"></td>
    <td><img src="https://user-images.githubusercontent.com/62181222/212751905-33b24392-ddba-458e-95a1-049d003fec3b.png" width="200"></td>
  </tr>
</table>
