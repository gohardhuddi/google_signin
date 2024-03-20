
# SocialConnects

A boilerplate for social signings

## Getting Started

This project is built using **Flutter version 3.19.2** stable with Firebase support and the following dependencies are used in the project.

cupertino_icons: ^1.0.6  
firebase_core: ^2.27.1  
firebase_auth: ^4.17.9  
google_sign_in: ^6.2.1
.
### prerequisites

1. To successfully compile the project first create a project at Firebase and under Firebase auth enable support for **Goole Sign-in**.
2. Generate SH1 for the Android project to achieve sign-in with Google using the following command:
   `   keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android `

3. Now create an Android app on Firebase and provide SH1.
4. Download `google-services.json` and paste it under `android/app`
5. Similarly create an app for iOS on Firebase.
6. Download `google-services-info.plist` and open iOS folder in Xcode to add this file.
7. Now paste `google-services-info.plist` under runner above info.plist.
8. Go to your **project directory -> ios -> Runner -> Info.plist** file, add the following there: `<!-- Put me in the [my_project]/ios/Runner/Info.plist file -->`

`<!-- Google Sign-in Section -->`

`<key>CFBundleURLTypes</key>`

`<array>`

`<dict>`

`<key>CFBundleTypeRole</key>`

`<string>Editor</string>`

`<key>CFBundleURLSchemes</key>`

`<array>`

`<!-- TODO Replace this value: -->`

`<!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->`

`<string>com.googleusercontent.apps.861823949799-vc35cprkp249096uujjn0vvnmcvjppkn</string>`

`</array>`

`</dict>`

`</array>`

`<!-- End of the Google Sign-in Section -->`

do not forget to import `signin_with_google.dart` , `response_model.dart` and `firebase_configuration.dart`  you are good to go.  
